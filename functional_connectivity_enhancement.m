
savedir = ['F:\Github_speed\movie_result'];
if ~exist(savedir,'dir')
    mkdir(savedir)
end
cd(savedir);

savename = fullfile(savedir,['functional_connectivity_enhancement_time_locked_to_response_onset']);

% load tract data
Tract1 = load(['F:\Github_speed\demo_data\making_video_for_functional_connectivity_enhancement.mat']);

Tract2 = load(['F:\Github_speed\demo_data\making_video_for_functional_connectivity_enhancement.mat']);

% ***** set condition ********************
fontsize = 4; % for font, 6

left_name = ['FunctionalConnectivity'];%need to change
right_name = ['FunctionalConnectivity'];

% *** for movie ***
Export_Movie = 1; % 1 = generate movie file
movie_time_range =[-500 250];
frame_number=3; % Increase the frame number if you want to slow motion.

Export_Fig = 1;
Snapshot_time = [-500 -400 -300 -200 -100 0 100 200]; 

amp_color_range=[-1 1];  % = transparency
Timeunit = 5; % ms

Side1 = Tract1.Data.tract_name;
Side2 = Tract2.Data.tract_name;
Setting.fnum = size(Tract1.Data.Alpha,2);
Setting.Time_all = Tract1.Data.time;

Alpha1 = Tract1.Data.Alpha';
Alpha2 = Tract2.Data.Alpha';
Tract_1 = Tract1.Tract;
Tract_2 = Tract2.Tract;

%Data.rpial_v = cat(3,Alpha1,Alpha2);

Title = ['response'];

[ftver, ftpath] = ft_version;
mesh_lh = load([ftpath filesep 'template/anatomy/surface_pial_left.mat']);
mesh_rh = load([ftpath filesep 'template/anatomy/surface_pial_right.mat']);

% *** generate movie ***
Generating_movies_DTI_ks4(Alpha1,Alpha2,Setting,savename,amp_color_range,Timeunit,frame_number,movie_time_range,fontsize,Title,left_name,right_name,Export_Movie,Export_Fig,Snapshot_time,Tract_1,Tract_2,mesh_lh,mesh_rh,Side1,Side2)
