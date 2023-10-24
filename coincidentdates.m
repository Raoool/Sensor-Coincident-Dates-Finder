%% Function to Find the near coincident dates between MSS5 and MSS4 or in between any two sensors
%  Author: Rahul Shah

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Inupt: Image drive location for sensors using to find near coincident
% dates in this case, I have used MSS 5 and MSS 4

% tolerance = number of days in between you want to find coincident date

% Output: Dates that coincident or near coincident between +/- days between
% two sensors date of acquistions.

% SDSU Image Processing Laboratory
% South Dakota State University

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Coincident = coincidentdates(MSS5_image_drive_location,MSS4_image_drive_location,tolerance)
    MSS5_acq_dates_available = dir(MSS5_image_drive_location);
    MSS5_acq_dates_available([1, 2])=[];
    vals_MSS5={MSS5_acq_dates_available([1:length(MSS5_acq_dates_available)]).name};
    Number_MSS5 = str2num(cell2mat(vals_MSS5(:)));
    %%%% MSS4 date reading
    MSS4_acq_dates_available = dir(MSS4_image_drive_location);
    MSS4_acq_dates_available([1, 2])=[];
    vals_MSS4={MSS4_acq_dates_available([1:length(MSS4_acq_dates_available)]).name};
    Number_MSS4 = str2num(cell2mat(vals_MSS4(:)));

    disp('date obtained');

    

    % Find the near coincident dates between Number_MSS5 and Number_MSS4
    coincident_dates = [];
    for i = 1:length(Number_MSS5)
        for j = 1:length(Number_MSS4)
            if abs(Number_MSS5(i) - Number_MSS4(j)) <= tolerance
                coincident_dates(end+1) = Number_MSS5(i);
            end
        end
    end
    Coincident.Dates_MSS5 = unique(coincident_dates);

    % Find the corresponding dates in Number_MSS4 for each near coincident date in Number_MSS5
    coincident_dates_MSS4 = [];
    for i = 1:length(coincident_dates)
        idx = find(abs(Number_MSS4 - coincident_dates(i)) <= tolerance, 1);
        if ~isempty(idx)
            coincident_dates_MSS4(end+1) = Number_MSS4(idx);
        end
    end

    Coincident.Dates_MSS4 = coincident_dates_MSS4;
end
