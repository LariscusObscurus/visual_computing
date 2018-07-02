%%
function [t, vertical, horizontal] = VectorExercise(N)
t = linspace(-2 * pi, 2 * pi, N);
t_shift_transpose = circshift(t, N / 2)';
vertical = [t',t_shift_transpose];
horizontal = [t ,t_shift_transpose'];
end
%%