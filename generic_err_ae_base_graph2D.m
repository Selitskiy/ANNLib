function generic_err_ae_base_graph2D(M, Em, Er, l_m, Y2, Sy2, l_y, l_sess, x_off, x_in, t_in, y_off, y_out, t_out, k_tob, t_sess, sess_off, offset, k_start, modelName, yLab)

    
    legItems = strings(0);

    f = figure();
        
    if(k_start==0)
        k_start=1;
    end

    [m,n]=size(M);



    M3 = zeros([m,n]);
    M4 = zeros([m,n]);

    %yyaxis left

    for k = 1:y_out
        lp = plot(k_start:l_m, M(k_start:l_m, y_off+k), 'LineStyle', '-', 'Color', 'b', 'MarkerSize', 1, 'LineWidth', 1);
        hold on;
        legIt = strcat('observation ', num2str(k));
        legItems = [legItems, legIt];
    end


    for i = 1:t_sess-sess_off
        %y_st2 = min(Sy2(1,:,i));
        %y_end2 = max(Sy2(2,:,i));

        j=1;
        y_st2 = min(Sy2(1,j,i));
        for j = 1:(t_in):k_tob
            for k = 1:t_in
            Myw = reshape(Y2(:, (j-1)*t_in + k, i), [y_out, t_out])';
            M3(Sy2(1,(j-1)*t_in + k,i):Sy2(2,(j-1)*t_in + k,i), y_off+1:y_off+y_out) = Myw;
            y_end2 = max(Sy2(2,(j-1)*t_in + k,i));
            end
        end

        for k = 1:y_out
            lp = plot(y_st2:y_end2, M3(y_st2:y_end2, y_off+k), 'LineStyle', '-', 'Color', 'r', 'MarkerSize', 1,'LineWidth', 1);
            hold on;
            legIt = strcat('prediction ', num2str(k));
            legItems = [legItems, legIt];
        end
    end

    title(strcat("Model ",modelName))
    xlabel('Observations')
    ylabel(yLab)

    legend(legItems)

    %yyaxis right
    %M4 = zeros([m,n]);
    %legItems = strings(0);
    %f = figure();
    %%col = ['g', 'c', 'y'];

    %for i = 1:t_sess-sess_off
    %    y_st2 = min(Sy2(1,:,i));
    %    y_end2 = max(Sy2(2,:,i));

    %    for j = 1:k_tob
    %        for k = 0:t_in
    %        Mew = reshape(Em(:, j, i), [y_out, t_out])';
    %        M4(Sy2(1,j + k*k_tob,i):Sy2(2,j + k*k_tob,i), y_off+1:y_off+y_out) = Mew;
    %        end
    %    end

    %    for k = 1:y_out
    %        lp = plot(y_st2:y_end2, M4(y_st2:y_end2, y_off+k), 'LineStyle', '-', 'Color', 'g', 'MarkerSize', 1,'LineWidth', 1);
    %        hold on;
    %        legIt = strcat('sess ', num2str(i), ', error ', num2str(k));
    %        legItems = [legItems, legIt];
    %    end
    %end

    %title(strcat("Model ",modelName))
    %xlabel('Observations')
    %ylabel('MAPE')
    %legend(legItems)


    %M4 = zeros([m,n]);
    %legItems = strings(0);
    %f = figure();
    %%col = ['g', 'c', 'y'];

    %for i = 1:t_sess-sess_off
    %    y_st2 = min(Sy2(1,:,i));
    %    y_end2 = max(Sy2(2,:,i));

    %    for j = 1:k_tob
    %        for k = 0:t_in
    %        Mew = reshape(Er(:, j, i), [y_out, t_out])';
    %        M4(Sy2(1,j + k*k_tob,i):Sy2(2,j + k*k_tob,i), y_off+1:y_off+y_out) = Mew;
    %        end
    %    end

    %    for k = 1:y_out
    %        lp = plot(y_st2:y_end2, M4(y_st2:y_end2, y_off+k), 'LineStyle', '-', 'Color', 'g', 'MarkerSize', 1,'LineWidth', 1);
    %        hold on;
    %        legIt = strcat('sess ', num2str(i), ', error ', num2str(k));
    %        legItems = [legItems, legIt];
    %    end
    %end

    %title(strcat("Model ",modelName))
    %xlabel('Observations')
    %ylabel('RMSE')
    %legend(legItems)
end