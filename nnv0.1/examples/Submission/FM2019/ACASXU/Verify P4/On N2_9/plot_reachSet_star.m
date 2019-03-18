load outputSet.mat;
load ACASXU_run2a_2_9_batch_2000.mat;

R = outputSet;
n = length(R); 

normalized_mat = range_for_scaling(6) * eye(5);
normalized_vec = means_for_scaling(6) * ones(5,1);

% normalize output set
P = []; 

fprintf('\nNormalize output set');
R = R.affineMap(normalized_mat, normalized_vec);

% output = [x1 = COC; x2 = Weak Left; x3 = Weak Right; x4 = Strong Left; x5 = Strong Right]
maps1 = [1 0 0 0 0; 0 1 0 0 0; 0 0 1 0 0]; % plot a projection on COC, Weak Left, Weak Right
maps2 = [1 0 0 0 0; 0 0 0 1 0; 0 0 0 0 1]; % plot a projection on COC, Strong Left Strong Right

R1 = R.affineMap(maps1, []);
R2 = R.affineMap(maps2, []);

% plot reachable set
fig = figure;
subplot(1, 2, 1);
R1.plot;
xlabel('COC', 'Fontsize', 16);
ylabel('Weak-Left', 'Fontsize', 16);
zlabel('Weak-Right', 'Fontsize', 16);
set(gca, 'Fontsize', 16);

subplot(1, 2, 2);
R2.plot;

xlabel('COC', 'Fontsize', 16);
ylabel('Strong-Left', 'Fontsize', 16);
zlabel('Strong-Right', 'Fontsize', 16);
set(gca, 'Fontsize', 16);

set(gca, 'Fontsize', 16);
saveas(gcf, 'reachSet_P4_on_N2_9.pdf');
