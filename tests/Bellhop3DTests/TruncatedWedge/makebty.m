clear
btyfil = 'wedge.bty';
interp_type = 'R';

zmax = 380;
zmin = 20;

slope_range = 7200;
wedge_angle = atand((zmax-zmin)/slope_range);
fprintf('Wedge angle = %.4f degrees \n',wedge_angle)

dx = 1.;
dy = 0.6;

xctr = 0;
xmin = -30;
xmax = +30;
x = (xmin:dx:xmax)+xctr;
nx = length(x);

yctr = 0; % dy/2;
ymin = -30;
ymax = +30;
y = (ymin:dy:ymax)+yctr;
ny = length(y);

z0 = 200;   % Depth at (0,0)
zy = z0 - y * 1000 * tand( wedge_angle );

% truncate the wedge
zy = max(zy,zmin);
zy = min(zy,zmax);
% zy = fliplr(zy);
z = repmat(zy(:),1,nx);

Bathy.X = x;
Bathy.Y = y;
Bathy.depth = z;

writebty3d( btyfil, Bathy )

% plotbty3d(btyfil)

