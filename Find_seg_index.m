function [Seg_index, Current_LL_Stuct, Current_RL_Stuct, Current_NL_Struct_1,...
    Current_NL_Struct_2] = Find_seg_index( HDMap_LL_Database,HDMap_RL_Database...
    , HDMap_NL_Database_1,HDMap_NL_Database_2, current_gps_lat,current_gps_long,...
    seg_samp_num_target)

pos_error = zeros(length(HDMap_LL_Database),1);
pos_error_NL_1 = zeros(length(HDMap_NL_Database_1),1);
pos_error_NL_2 = zeros(length(HDMap_NL_Database_2),1);

for n = 1:length(HDMap_LL_Database)
    pos_error(n,1) = sqrt(((HDMap_LL_Database(n).start_end_point(1,1) -...
        current_gps_lat)*(110.575*1000))^2 ...
        + ((HDMap_LL_Database(n).start_end_point(1,2) - current_gps_long)...
        *(82.4102*1000))^2) + sqrt(((HDMap_RL_Database(n).start_end_point(1,1) -...
        current_gps_lat)*(110.575*1000))^2 ...
        + ((HDMap_RL_Database(n).start_end_point(1,2) - current_gps_long)...
        *(82.4102*1000))^2) + ...
        sqrt(((HDMap_LL_Database(n).start_end_point(2,1) -...
        current_gps_lat)*(110.575*1000))^2 ...
        + ((HDMap_LL_Database(n).start_end_point(2,2) - current_gps_long)...
        *(82.4102*1000))^2) + sqrt(((HDMap_RL_Database(n).start_end_point(2,1) -...
        current_gps_lat)*(110.575*1000))^2 ...
        + ((HDMap_RL_Database(n).start_end_point(2,2) - current_gps_long)...
        *(82.4102*1000))^2);
end

for n = 1:length(HDMap_NL_Database_1)
    pos_error_NL_1(n,1) = sqrt(((HDMap_NL_Database_1(n).NLL_start_end_point(1,1) -...
        current_gps_lat)*(110.575*1000))^2 ...
        + ((HDMap_NL_Database_1(n).NLL_start_end_point(1,2) - current_gps_long)...
        *(82.4102*1000))^2) + sqrt(((HDMap_NL_Database_1(n).NRL_start_end_point(1,1) -...
        current_gps_lat)*(110.575*1000))^2 ...
        + ((HDMap_NL_Database_1(n).NRL_start_end_point(1,2) - current_gps_long)...
        *(82.4102*1000))^2);
end

for n = 1:length(HDMap_NL_Database_2)
    pos_error_NL_2(n,1) = sqrt(((HDMap_NL_Database_2(n).NLL_start_end_point(1,1) -...
        current_gps_lat)*(110.575*1000))^2 ...
        + ((HDMap_NL_Database_2(n).NLL_start_end_point(1,2) - current_gps_long)...
        *(82.4102*1000))^2) + sqrt(((HDMap_NL_Database_2(n).NRL_start_end_point(1,1) -...
        current_gps_lat)*(110.575*1000))^2 ...
        + ((HDMap_NL_Database_2(n).NRL_start_end_point(1,2) - current_gps_long)...
        *(82.4102*1000))^2);
end


Seg_index = find(pos_error==min(pos_error));
Seg_index_NL_1 = find(pos_error_NL_1==min(pos_error_NL_1));
Seg_index_NL_2 = find(pos_error_NL_2==min(pos_error_NL_2));

Current_LL_Stuct = HDMap_LL_Database(Seg_index);
Current_LL_Stuct.seg_samp_num_target = seg_samp_num_target(Seg_index);

Current_RL_Stuct = HDMap_RL_Database(Seg_index);
Current_RL_Stuct.seg_samp_num_target = seg_samp_num_target(Seg_index);

Current_NL_Struct_1 = HDMap_NL_Database_1(Seg_index_NL_1);
Current_NL_Struct_2 = HDMap_NL_Database_2(Seg_index_NL_2);

end

