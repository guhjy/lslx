# Generated by using Rcpp::compileAttributes() -> do not edit by hand
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

compute_regularized_path_cpp <- function(reduced_data, reduced_model, control, supplied_result, fitted_result) {
    invisible(.Call('_lslx_compute_regularized_path_cpp', PACKAGE = 'lslx', reduced_data, reduced_model, control, supplied_result, fitted_result))
}

compute_coefficient_matrix_cpp <- function(theta_value, reduced_data, reduced_model, control, supplied_result) {
    .Call('_lslx_compute_coefficient_matrix_cpp', PACKAGE = 'lslx', theta_value, reduced_data, reduced_model, control, supplied_result)
}

compute_implied_cov_cpp <- function(theta_value, reduced_data, reduced_model, control, supplied_result) {
    .Call('_lslx_compute_implied_cov_cpp', PACKAGE = 'lslx', theta_value, reduced_data, reduced_model, control, supplied_result)
}

compute_implied_mean_cpp <- function(theta_value, reduced_data, reduced_model, control, supplied_result) {
    .Call('_lslx_compute_implied_mean_cpp', PACKAGE = 'lslx', theta_value, reduced_data, reduced_model, control, supplied_result)
}

compute_model_jacobian_cpp <- function(theta_value, reduced_data, reduced_model, control, supplied_result) {
    .Call('_lslx_compute_model_jacobian_cpp', PACKAGE = 'lslx', theta_value, reduced_data, reduced_model, control, supplied_result)
}

compute_bfgs_hessian_cpp <- function(theta_value, reduced_data, reduced_model, control, supplied_result) {
    .Call('_lslx_compute_bfgs_hessian_cpp', PACKAGE = 'lslx', theta_value, reduced_data, reduced_model, control, supplied_result)
}

compute_expected_information_cpp <- function(theta_value, reduced_data, reduced_model, control, supplied_result) {
    .Call('_lslx_compute_expected_information_cpp', PACKAGE = 'lslx', theta_value, reduced_data, reduced_model, control, supplied_result)
}

compute_observed_information_cpp <- function(theta_value, reduced_data, reduced_model, control, supplied_result) {
    .Call('_lslx_compute_observed_information_cpp', PACKAGE = 'lslx', theta_value, reduced_data, reduced_model, control, supplied_result)
}

compute_score_acov_cpp <- function(theta_value, reduced_data, reduced_model, control, supplied_result) {
    .Call('_lslx_compute_score_acov_cpp', PACKAGE = 'lslx', theta_value, reduced_data, reduced_model, control, supplied_result)
}

compute_loss_value_cpp <- function(theta_value, reduced_data, reduced_model, control, supplied_result) {
    .Call('_lslx_compute_loss_value_cpp', PACKAGE = 'lslx', theta_value, reduced_data, reduced_model, control, supplied_result)
}

compute_loss_gradient_cpp <- function(theta_value, reduced_data, reduced_model, control, supplied_result) {
    .Call('_lslx_compute_loss_gradient_cpp', PACKAGE = 'lslx', theta_value, reduced_data, reduced_model, control, supplied_result)
}

compute_regularizer_gradient_cpp <- function(theta_value, lambda, delta, reduced_data, reduced_model, control, supplied_result) {
    .Call('_lslx_compute_regularizer_gradient_cpp', PACKAGE = 'lslx', theta_value, lambda, delta, reduced_data, reduced_model, control, supplied_result)
}

compute_objective_gradient_cpp <- function(theta_value, lambda, delta, reduced_data, reduced_model, control, supplied_result) {
    .Call('_lslx_compute_objective_gradient_cpp', PACKAGE = 'lslx', theta_value, lambda, delta, reduced_data, reduced_model, control, supplied_result)
}

compute_saturated_moment_cpp <- function(y_obs, w, m_idx, saturated_mean, saturated_cov, iter_other_max, tol_other) {
    invisible(.Call('_lslx_compute_saturated_moment_cpp', PACKAGE = 'lslx', y_obs, w, m_idx, saturated_mean, saturated_cov, iter_other_max, tol_other))
}

compute_saturated_moment_acov_response_cpp <- function(y_obs, w, m_idx, m2_idx, saturated_mean, saturated_cov, saturated_moment_acov) {
    invisible(.Call('_lslx_compute_saturated_moment_acov_response_cpp', PACKAGE = 'lslx', y_obs, w, m_idx, m2_idx, saturated_mean, saturated_cov, saturated_moment_acov))
}

compute_saturated_moment_acov_moment_cpp <- function(n_observation, sample_proportion, saturated_cov, saturated_moment_acov) {
    invisible(.Call('_lslx_compute_saturated_moment_acov_moment_cpp', PACKAGE = 'lslx', n_observation, sample_proportion, saturated_cov, saturated_moment_acov))
}

