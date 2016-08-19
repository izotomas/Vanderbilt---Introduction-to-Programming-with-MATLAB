function mbd = spherical_mirror_aberr(fn,D)
x = 0:0.01:D/2;
f = fn*D;
theta = asin(x/(2*f));
d = 2 * f * tan(2 * theta) .* (1. / cos(theta) - 1);
mbd = ((8 * 0.01)/ D^2) * sum(x .* d);
end
