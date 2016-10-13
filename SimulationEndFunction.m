
%% Plot function

%Create figure with white background
figure1 = figure('Color',[1 1 1]);

%% Subplot 1 - Population density
subplot(3, 1, 1)
hold on

% Calculate y max for highlighting parameters.
ylim_max = max(sum(all_x(1:end, :), 2)) * 1.1;

% Highlight abiraterone administration times
for i = 1:1:size(abiCycleInfo, 1)
    rectangle('Position', [abiCycleInfo(i, 1) 0 abiCycleInfo(i, 2) ylim_max], 'FaceColor', [0.9, 0.9, 0.9], 'EdgeColor', 'none')
end

% Plot population densities and total population
h1 = plot(all_x(1:end,1), 'Color', [0.0, .57, .57] , 'LineWidth', 6, 'DisplayName', 'T+');
h2 = plot(all_x(1:end,2), 'LineStyle',':', 'Color', [0.74, .42, 1] , 'LineWidth', 6, 'DisplayName', 'TP');
h3 = plot(all_x(1:end,3), 'LineStyle','--', 'Color', [0.91 0.41 0.17] , 'LineWidth', 6, 'DisplayName', 'T-');
h4 = plot(sum(all_x(1:end, :), 2), 'Color', [0.5, .5, .5] , 'LineWidth', 1, 'DisplayName', 'Total Population');

% Beautify
xlabel('Simulated Time', 'FontSize', 34)
ylabel(sprintf('Population \nSize'), 'FontSize', 34)
xlim([0 size(all_x, 1)])
ylim([0 ylim_max])
legend ([h1 h2 h3 h4], {'T+' 'TP' 'T-' 'Total Population'}, 'FontSize', 28);
set(gca, 'FontSize', 30)


%% Subplot 2 - Population frequency
subplot(3, 1, 2)
hold on

% Highlight abiraterone administration times
for i = 1:1:size(abiCycleInfo, 1)
    rectangle('Position', [abiCycleInfo(i, 1) 0 abiCycleInfo(i, 2) ylim_max], 'FaceColor', [0.9, 0.9, 0.9], 'EdgeColor', 'none')
end

% Plot population frequencies
h5 = plot(all_p(1:end,1), 'Color', [0.0, .57, .57] , 'LineWidth', 6, 'DisplayName', 'T+');
h6 = plot(all_p(1:end,2), 'LineStyle',':', 'Color', [0.74, .42, 1] , 'LineWidth', 6, 'DisplayName', 'TP');
h7 = plot(all_p(1:end,3), 'LineStyle','--', 'Color', [0.91 0.41 0.17] , 'LineWidth', 6, 'DisplayName', 'T-');

%Beautify
xlabel('Simulated Time', 'FontSize', 34)
ylabel(sprintf('Population \nFrequency'), 'FontSize', 34)
xlim([0 size(all_x, 1)])
ylim([0 1]);
legend ([h5 h6 h7], {'T+' 'TP' 'T-'}, 'FontSize', 28);
set(gca, 'FontSize', 30)


%% Subplot 3 - PSA
subplot(3, 1, 3)
hold on

% Uncomment this for true PSA values. Commented for relative values.
PSA_GiveABI = 1;

%Plot PSA relative to PSA_GiveABI
plot(all_PSA(1:end)./PSA_GiveABI, 'k' , 'LineWidth', 6);
hold on

%Highlight Abiraterone administration in red.
for i = 1:1:size(abiCycleInfo, 1)
    start = abiCycleInfo(i, 1);
    stop = abiCycleInfo(i, 1) + abiCycleInfo(i, 2);
    plot(start:stop, all_PSA(start:stop)./PSA_GiveABI, 'r' , 'LineWidth', 6);
end

%Beautify
xlim([0 size(all_x, 1)])
xlabel('Simulated Time', 'FontSize', 34)
ylabel(sprintf('Normalized \nPSA'), 'FontSize', 34)
set(gca, 'FontSize', 30)


