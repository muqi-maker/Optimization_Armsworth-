% CHECK_COUNTY_DATA
% Loads the CSV with load_county_data.m and prints sanity-check numbers.
% Put the CSV in the same folder as these .m files first.

csvFile = 'Combined_county_data_labeled_2018-07-23 (5).csv';
costFile = 'Diane_costs_0123_noheaders.csv';  
D = load_county_data(csvFile, costFile); 


fprintf('usable counties       : %d (dropped %d with missing data)\n', D.nCounty, D.nDropped);
fprintf('species columns       : %d\n', D.nSpecies);
fprintf('priority species (w=1): %d\n', sum(D.w));
fprintf('size of B             : %d x %d\n', size(D.B, 1), size(D.B, 2));

% Logical indexing: keep only the columns where w == 1
Bpri = D.B(:, D.w == 1);
fprintf('size of B (priority)  : %d x %d\n', size(Bpri, 1), size(Bpri, 2));

fprintf('cost c ($/ha)         : min %.0f, median %.0f, max %.0f\n', ...
        min(D.c), median(D.c), max(D.c));
fprintf('d1 clipped to 0 in    : %d counties\n', D.nD1Clipped);

% One concrete example so you can see what a single cell means
fprintf('\nExample: %s County, %s\n', D.countyName(1), D.stateName(1));
fprintf('  species 1 = %s (IUCN %s)\n', D.speciesName(1), D.speciesIUCN(1));
fprintf('  its range inside this county = %.1f ha\n', D.B(1, 1));
