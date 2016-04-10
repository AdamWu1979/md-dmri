function out_path = mdm_bruker_dt_rare2d_recon(base_path, c_exp, base_o_path, opt)% function out_path = mdm_bruker_dt_rare2d_recon(base_path, c_exp, base_o_path, opt)%% Recon images acquired with Bruker pulse sequence DT_axderare2d.%% Works in progressif (nargin < 4), opt.present = 1; end% Image recon parametersrps.smooth          = 300e-6;rps.npix.read       = 16;rps.npix.phase      = rps.npix.read;rps.shift_read      = -.25e-3;opt = mdm_opt(opt);% Fit modelsind_start = 2; % Exclude first image% Book-keepingdata_path = fullfile(base_path, num2str(c_exp));out_path  = fullfile(base_o_path, num2str(c_exp)); msf_mkdir(fullfile(out_path)); xps_fn = fullfile(out_path, 'xps.mat');nii_fn = fullfile(out_path, ['data' opt.nii_ext]);% convert bruker acquistion parameters to xpsmdm_bruker_acqus2mat(data_path);mdm_bruker_dt_axderare2d_acqus2xps(data_path, xps_fn);mdm_bruker_dt_rare2d_ser2nii(data_path, nii_fn, rps);s.nii_fn = nii_fn;s.xps = mdm_xps_load(xps_fn); mdm_s_subsample(s, (1:s.xps.n) >= ind_start);