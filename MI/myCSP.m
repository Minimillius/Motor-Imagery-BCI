function w = myCSP(data1, data2, m)
    Rh = computeCovarianceMatrix(data1);
    Rf = computeCovarianceMatrix(data2);

    [u, v] = eig(Rh, Rf);
    v = diag(v);
    [~, ind] = sort(v, 'descend');
    u = u(:, ind);

    w = [u(:, 1:m), u(:, end - m + 1:end)];
end

function R = computeCovarianceMatrix(data)
    numTrials = size(data, 3);
    [channels, ~, trials] = size(data);  % Get the number of channels and trials
    
    R = zeros(channels);

    for i = 1:numTrials
        x = data(:, :, i);
        x = bsxfun(@minus, x, mean(x, 2));
        R = R + (x * x') / trace((x * x'));
    end

    R = R / trials;  % Corrected normalization
end

