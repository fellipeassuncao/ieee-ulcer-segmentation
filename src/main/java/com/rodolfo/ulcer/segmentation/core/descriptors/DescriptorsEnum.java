package com.rodolfo.ulcer.segmentation.core.descriptors;

public enum DescriptorsEnum {

    // COR BGR
    color_bgr_b_mean,
    color_bgr_g_mean,
    color_bgr_r_mean,
    color_bgr_b_variance,
    color_bgr_g_variance,
    color_bgr_r_variance,
    color_bgr_b_centroid,
    color_bgr_g_centroid,
    color_bgr_r_centroid,
    color_bgr_b_asymetry,
    color_bgr_g_asymetry,
    color_bgr_r_asymetry,
    color_bgr_b_intensity1,
    color_bgr_g_intensity1,
    color_bgr_r_intensity1,
    color_bgr_b_intensity2,
    color_bgr_g_intensity2,
    color_bgr_r_intensity2,
    color_bgr_b_frequency1,
    color_bgr_g_frequency1,
    color_bgr_r_frequency1,
    color_bgr_b_frequency2,
    color_bgr_g_frequency2,
    color_bgr_r_frequency2,
    // COR LAB
    color_lab_l_mean,
    color_lab_a_mean,
    color_lab_b_mean,
    color_lab_l_variance,
    color_lab_a_variance,
    color_lab_b_variance,
    color_lab_l_centroid,
    color_lab_a_centroid,
    color_lab_b_centroid,
    color_lab_l_asymetry,
    color_lab_a_asymetry,
    color_lab_b_asymetry,
    color_lab_l_intensity1,
    color_lab_a_intensity1,
    color_lab_b_intensity1,
    color_lab_l_intensity2,
    color_lab_a_intensity2,
    color_lab_b_intensity2,
    color_lab_l_frequency1,
    color_lab_a_frequency1,
    color_lab_b_frequency1,
    color_lab_l_frequency2,
    color_lab_a_frequency2,
    color_lab_b_frequency2,
    // COR LUV
    color_luv_l_mean,
    color_luv_u_mean,
    color_luv_v_mean,
    color_luv_l_variance,
    color_luv_u_variance,
    color_luv_v_variance,
    color_luv_l_centroid,
    color_luv_u_centroid,
    color_luv_v_centroid,
    color_luv_l_asymetry,
    color_luv_u_asymetry,
    color_luv_v_asymetry,
    color_luv_l_intensity1,
    color_luv_u_intensity1,
    color_luv_v_intensity1,
    color_luv_l_intensity2,
    color_luv_u_intensity2,
    color_luv_v_intensity2,
    color_luv_l_frequency1,
    color_luv_u_frequency1,
    color_luv_v_frequency1,
    color_luv_l_frequency2,
    color_luv_u_frequency2,
    color_luv_v_frequency2,
    // COR NORM
    color_norm_b_mean,
    color_norm_g_mean,
    color_norm_r_mean,
    color_norm_b_variance,
    color_norm_g_variance,
    color_norm_r_variance,
    color_norm_b_centroid,
    color_norm_g_centroid,
    color_norm_r_centroid,
    color_norm_b_asymetry,
    color_norm_g_asymetry,
    color_norm_r_asymetry,
    color_norm_b_intensity1,
    color_norm_g_intensity1,
    color_norm_r_intensity1,
    color_norm_b_intensity2,
    color_norm_g_intensity2,
    color_norm_r_intensity2,
    color_norm_b_frequency1,
    color_norm_g_frequency1,
    color_norm_r_frequency1,
    color_norm_b_frequency2,
    color_norm_g_frequency2,
    color_norm_r_frequency2,

    // HARALICK
    // BGR_B
    haralick_bgr_b_contrast,
    haralick_bgr_b_energy,
    haralick_bgr_b_entropy,
    haralick_bgr_b_homogeneity,
    haralick_bgr_b_correlation,
    // BGR_G
    haralick_bgr_g_contrast,
    haralick_bgr_g_energy,
    haralick_bgr_g_entropy,
    haralick_bgr_g_homogeneity,
    haralick_bgr_g_correlation,
    // BGR_R
    haralick_bgr_r_contrast,
    haralick_bgr_r_energy,
    haralick_bgr_r_entropy,
    haralick_bgr_r_homogeneity,
    haralick_bgr_r_correlation,
    // LAB_A
    haralick_lab_a_contrast,
    haralick_lab_a_energy,
    haralick_lab_a_entropy,
    haralick_lab_a_homogeneity,
    haralick_lab_a_correlation,
    // LAB_B
    haralick_lab_b_contrast,
    haralick_lab_b_energy,
    haralick_lab_b_entropy,
    haralick_lab_b_homogeneity,
    haralick_lab_b_correlation,
    // LUV_U
    haralick_luv_u_contrast,
    haralick_luv_u_energy,
    haralick_luv_u_entropy,
    haralick_luv_u_homogeneity,
    haralick_luv_u_correlation,
    // LUV_V
    haralick_luv_v_contrast,
    haralick_luv_v_energy,
    haralick_luv_v_entropy,
    haralick_luv_v_homogeneity,
    haralick_luv_v_correlation,
    // BGR_BG
    haralick_bgr_bg_contrast,
    haralick_bgr_bg_energy,
    haralick_bgr_bg_entropy,
    haralick_bgr_bg_homogeneity,
    haralick_bgr_bg_correlation,
    // BGR_BR
    haralick_bgr_br_contrast,
    haralick_bgr_br_energy,
    haralick_bgr_br_entropy,
    haralick_bgr_br_homogeneity,
    haralick_bgr_br_correlation,
    // BGR_GR
    haralick_bgr_gr_contrast,
    haralick_bgr_gr_energy,
    haralick_bgr_gr_entropy,
    haralick_bgr_gr_homogeneity,
    haralick_bgr_gr_correlation,
    // LAB_AB
    haralick_lab_ab_contrast,
    haralick_lab_ab_energy,
    haralick_lab_ab_entropy,
    haralick_lab_ab_homogeneity,
    haralick_lab_ab_correlation,
    // LUV_UV
    haralick_luv_uv_contrast,
    haralick_luv_uv_energy,
    haralick_luv_uv_entropy,
    haralick_luv_uv_homogeneity,
    haralick_luv_uv_correlation,

    // LBPH
    lbph_bgr_b_mean,
    lbph_bgr_b_variance,
    lbph_bgr_b_entropy,
    lbph_bgr_b_energy,
    lbph_bgr_g_mean,
    lbph_bgr_g_variance,
    lbph_bgr_g_entropy,
    lbph_bgr_g_energy,
    lbph_bgr_r_mean,
    lbph_bgr_r_variance,
    lbph_bgr_r_entropy,
    lbph_bgr_r_energy,

    // WAVELET HAAR
    wavelet_bgr_b_3_lh_entropy,
    wavelet_bgr_b_3_hh_entropy,
    wavelet_bgr_b_3_hl_entropy,
    wavelet_bgr_b_3_lh_energy,
    wavelet_bgr_b_3_hh_energy,
    wavelet_bgr_b_3_hl_energy,
    // 
    wavelet_bgr_g_3_lh_entropy,
    wavelet_bgr_g_3_hh_entropy,
    wavelet_bgr_g_3_hl_entropy,
    wavelet_bgr_g_3_lh_energy,
    wavelet_bgr_g_3_hh_energy,
    wavelet_bgr_g_3_hl_energy,
    // 
    wavelet_bgr_r_3_lh_entropy,
    wavelet_bgr_r_3_hh_entropy,
    wavelet_bgr_r_3_hl_entropy,
    wavelet_bgr_r_3_lh_energy,
    wavelet_bgr_r_3_hh_energy,
    wavelet_bgr_r_3_hl_energy,

}