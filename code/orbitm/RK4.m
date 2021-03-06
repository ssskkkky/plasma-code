function [dx,dy,dz] = RK4(x0,y0,z0,fr,ft,fz,r,z,h)

r0 = sqrt(x0^2 + y0^2);
br = interp2(r,z,fr,r0,z0);
bt = interp2(r,z,ft,r0,z0);
bz = interp2(r,z,fz,r0,z0);
bx = br * x0 / r0 - bt * y0 / r0;
by = br * y0 / r0 + bt * x0 / r0;
b = sqrt(bx^2 + by^2 + bz^2);
k0x = bx / b;
k0y = by / b;
k0z = bz / b;
x1 = x0 + k0x * h / 2;
y1 = y0 + k0y * h / 2;
z1 = z0 + k0z * h / 2;
r1 = sqrt(x1^2 + y1^2);
br = interp2(r,z,fr,r1,z1);
bt = interp2(r,z,ft,r1,z1);
bz = interp2(r,z,fz,r1,z1);
bx = br * x1 / r1 - bt * y1 / r1;
by = br * y1 / r1 + bt * x1 / r1;
b = sqrt(bx^2 + by^2 + bz^2);
k1x = bx / b;
k1y = by / b;
k1z = bz / b;
x2 = x0 + k1x * h / 2;
y2 = y0 + k1y * h / 2;
z2 = z0 + k1z * h / 2;
r2 = sqrt(x2^2 + y2^2);
br = interp2(r,z,fr,r2,z2);
bt = interp2(r,z,ft,r2,z2);
bz = interp2(r,z,fz,r2,z2);
bx = br * x2 / r2 - bt * y2 / r2;
by = br * y2 / r2 + bt * x2 / r2;
b = sqrt(bx^2 + by^2 + bz^2);
k2x = bx / b;
k2y = by / b;
k2z = bz / b;
x3 = x0 + k2x * h;
y3 = y0 + k2y * h;
z3 = z0 + k2z * h;
r3 = sqrt(x3^2 + y3^2);
br = interp2(r,z,fr,r3,z3);
bt = interp2(r,z,ft,r3,z3);
bz = interp2(r,z,fz,r3,z3);
bx = br * x3 / r3 - bt * y3 / r3;
by = br * y3 / r3 + bt * x3 / r3;
b = sqrt(bx^2 + by^2 + bz^2);
k3x = bx / b;
k3y = by / b;
k3z = bz / b;
dx = (k0x + 2 * k1x + 2 * k2x + k3x) * h / 6;
dy = (k0y + 2 * k1y + 2 * k2y + k3y) * h / 6;
dz = (k0z + 2 * k1z + 2 * k2z + k3z) * h / 6;

end

