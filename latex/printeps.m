function printeps(fignum,figname,size)
% This is a simple function that overrides Matlab's desire to call all fonts
% 'Helvetica' in an exported .eps file. This is particularly annoying if you 
% want to produce pdf with embedded font.
%
% Syntax:
%
% printeps(fignum,figname,size)
%
% Examples:
%
% printeps(1,'test') prints the contents of figure 1 to test.eps 
%
% printeps(1,'test',14) prints the contents of figure 1 to test.eps with 
% 14 points sized font.
%
% Note: This is a global change of font in the file. That is, any text you
% add via text() and title() commands will end up in the default axes font.
% this is because there is no easy way to parse out the fonts of these
% objects in the .eps file for replacement.
%

% Created by J. Aumentado 04/20/05
% Modified by G. Laurent 04/04/07
% Modified by G. Laurent 21/04/07
% Modified by G. Laurent 08/01/09
% Modified by G. Laurent 05/03/10

if nargin>2,
   XLabel(get(get(gca,'XLabel'),'String'),'FontSize',size);
   YLabel(get(get(gca,'YLabel'),'String'),'FontSize',size);
   set(gca,'FontSize',size);
end

figfilestr = [figname '.eps'];
eval(['print -depsc2 -f' num2str(fignum) ' ' figfilestr ';']);

% now read in the file
fid = fopen(figfilestr);
ff = char(fread(fid))';
fclose(fid);

%these are the only allowed fonts in MatLab and so we have to weed them out
%and replace them:
mlabfontlist = {'AvantGarde','Helvetica-Narrow','Times-Roman','Bookman',...
    'NewCenturySchlbk','ZapfChancery','Courier','Palatino','ZapfDingbats',...
    'Helvetica'};%,'Symbol'};

for k = 1:length(mlabfontlist)
ff = strrep(ff,mlabfontlist{k},'Arial');
end

% open the file up and overwrite it
fid = fopen(figfilestr,'w');
fprintf(fid,'%s',ff);
fclose(fid);


