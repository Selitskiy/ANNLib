function [E2f, S2, S2Mean, S2Std, S2s, ma_rmse, sess_ma_idx, ob_ma_idx, mi_rmse, sess_mi_idx, ob_mi_idx]=generic_calc_ae_base_cont_rmse2D(Y2, Yh2, n_out, y_out, k_tob, t_out_ae)

    [~, ktob_tin, nsess]=size(Y2);

    n_sw = floor(ktob_tin/t_out_ae);

    E2f = zeros([n_out, n_sw, nsess]);
  
    for j=1:n_sw-1
        E2f(:, j, :) = ((Y2(1:n_out, j*t_out_ae+1, :) - Y2(1:n_out, j*t_out_ae, :))).^2;
    end

    for i=1:nsess-1
        E2f(:, n_sw, i) = ((Y2(1:n_out, 1, i+1) - Y2(1:n_out, end, i))).^2;
    end
    
    [skn, sjf, sif] = size(E2f);
    S2 = sum(E2f, [2,3]);
    Sn2 = sjf*sif;
    
    S2 = sum(sqrt(S2/Sn2), 1)/skn;

    [ma_errs, i] = max(E2f, [], [1 2],"linear");
    [ma_err, sess_ma_idx]=max(sqrt(ma_errs));
    ob_ma_idx = i(sess_ma_idx);
    ma_rmse = sqrt(sum(ma_errs)/sif);

    [mi_errs, i] = min(E2f, [], [1 2],"linear");
    [mi_err, sess_mi_idx]=min(sqrt(mi_errs));
    ob_mi_idx = i(sess_mi_idx);
    mi_rmse = sqrt(sum(mi_errs)/sif);

    % Per session mean+std
    S2s = sum(E2f, 2);
    Sn2s = sjf;
    
    S2s = sum(sqrt(S2s/Sn2s), 1)/skn;
    S2Mean = mean(S2s);
    S2Std = std(S2s);
end