%%
function SineWaveExercise(ax_1, ax_2, t)
y = sin(t);
plot(ax_1, t, y)
v = (y < 0)
y(v) = -y(v)
plot(ax_2, t, y)
end
%%