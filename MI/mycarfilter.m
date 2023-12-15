function [cnt_f] = mycarfilter(cnt)
mu = mean(cnt, 2);
for i  = 1:size(cnt, 2)
    xi = cnt(:, i);
    cnt_f(:, i) = xi- mu;
end
end

