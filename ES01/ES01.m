%%
function main()
disp("Running Exercise 1")
% 1. Vector
t_8 = VectorExercise(8);
t_16 = VectorExercise(16);
t_512 = VectorExercise(512);

% 2. SineWave
figure
ax_1 = subplot(2, 1, 1);
ax_2 = subplot(2, 1, 2);
hold (ax_1, 'on');
hold (ax_2, 'on');
SineWaveExercise(ax_1, ax_2, t_8);
SineWaveExercise(ax_1, ax_2, t_16);
SineWaveExercise(ax_1, ax_2, t_512);
hold (ax_1, 'off');
hold (ax_2, 'off');

% 3. Gauss
figure
gauss_data = -10:0.2:10

ax_1 = subplot(2, 2, 1);
ax_2 = subplot(2, 2, 2);
ax_3 = subplot(2, 2, 3);
ax_4 = subplot(2, 2, 4);

hold (ax_1, 'on');
hold (ax_2, 'on');
hold (ax_3, 'on');
hold (ax_4, 'on');

grid(ax_1, 'on');
grid(ax_2, 'on');
grid(ax_3, 'on');
grid(ax_4, 'on');

ylabel(ax_1, 'gauss1d');
ylabel(ax_2, 'gauss1d');
ylabel(ax_3, 'gauss1d');
ylabel(ax_4, 'gauss1d');

plot(ax_1, gauss_data, gauss1d(gauss_data, 1));
title(ax_1, 'sigma=1');

plot(ax_2, gauss_data, gauss1d(gauss_data, 3));
title(ax_2, 'sigma=3');

plot(ax_3, gauss_data, gauss1d(gauss_data, 6));
title(ax_3, 'sigma=6');


plot(ax_4, gauss_data, gauss1d(gauss_data, 0.1));
plot(ax_4, gauss_data, gauss1d(gauss_data, 1));
plot(ax_4, gauss_data, gauss1d(gauss_data, 3));
plot(ax_4, gauss_data, gauss1d(gauss_data, 6));
title(ax_4, 'all together');

hold (ax_1, 'off');
hold (ax_2, 'off');
hold (ax_3, 'off');
hold (ax_4, 'off');

% 4. Matrices
figure
A = rand(100) .* 1000;
row_sum = sum(A, 2);
col_sum = sum(A, 1);

mean_row = mean(A, 2);
mean_col = mean(A, 1);

filtered = A < 20;
count_values = sum(filtered(:));
mean_threshold = mean(A(filtered));

A(filtered) = 123;
A = A';

reshaped = reshape(A, 2, []);
A_noise = (rand(100) .* 1000) + A;

ax_1 = subplot(3, 2, 1);
ax_2 = subplot(3, 2, 2);
ax_3 = subplot(3, 2, 3);
ax_4 = subplot(3, 2, 4);
ax_5 = subplot(3, 2, 5);

hold (ax_1, 'on');
hold (ax_2, 'on');
hold (ax_3, 'on');
hold (ax_4, 'on');
hold (ax_5, 'on');

plot(ax_1, row_sum);
plot(ax_1, col_sum);
plot(ax_2, mean_row);
plot(ax_2, mean_col);

labels = categorical({'Count','Mean'})
bar(ax_3, labels, [count_values, mean_threshold]);
histogram(ax_4, A);
histogram(ax_5, A_noise);

legend(ax_1, 'row', 'col');
legend(ax_2, 'row', 'col');

title(ax_1, 'Sum');
title(ax_2, 'Mean');
title(ax_3, 'Thresholds');
title(ax_4, 'Histogram A');
title(ax_4, 'Histogram A noise');



end
%%















