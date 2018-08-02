% Copyright 2018 National Institute of Advanced Industrial Science and Technology (AIST)
% 
% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
% 
%    http://www.apache.org/licenses/LICENSE-2.0
% 
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.

v = VideoReader('S08_Brownie_7150991-935.avi');
load Yn2.mat;
num_frames = fix(v.Duration) * v.FrameRate;
X = zeros(v.Height, v.Width, 3, num_frames, 'uint8');
vec = @(x) x(:);
scale = 1 / 4;
h = v.Height * scale;
w = v.Width * scale;
Y = zeros(h * w, num_frames);
f = 1;
while f <= num_frames && hasFrame(v)
  X(:, :, :, f) = readFrame(v);
  Y(:, f) = vec(imresize(rgb2gray(im2double(X(:, :, :, f))), scale));
  f = f + 1;
end

%%
alpha = 5;
r = 30;
verbose = true;
b=0.25;
Yn2=b*Yn;
Y2=Y;
Y=[Y2;Yn2];
[ind, C] = smrs(Y, alpha, r, verbose);

%%
valid_ind = ind(sum(Y(:, ind)) > 0)
I = length(valid_ind);
H = h / scale;
W = w / scale;
tile = zeros(H, W * I, 3, class(X));
for i = 1:I
  tile(:, (1:W) + (i - 1) * W, :) = X(:, :, :, valid_ind(i));
end
  figure;
  image(tile)
