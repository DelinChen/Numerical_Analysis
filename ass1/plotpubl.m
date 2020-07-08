function plotpubl(width,msize);
%
% change default linewidths of all new and present figures
% to make publication quality figures
%
% call publ(width)
%     default value for width is 0.5
%     typical value for width for figure to be used in a publication is 1-2
%
% optional  input msize changes marker size
% Based on Sverre Holm, University of Oslo 6. Nov 1998
%

if (nargin ==1),
% change all following figures: 	
	set(0,'DefaultAxesLineWidth',width);
	set(0,'DefaultLineLineWidth',width);
	get(0,'Default');
%
% change this figure:
	set(gca,'LineWidth', width);
	h = get(gca,'children');
   set(h,'LineWidth',width);
end
%added by mrt
if (nargin ==2),
	set(0,'DefaultLineMarkerSize',msize);
	get(0,'Default');
end
return
