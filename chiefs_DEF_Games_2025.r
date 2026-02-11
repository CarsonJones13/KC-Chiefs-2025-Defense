library(nflreadr)
> library(dplyr)
> 
> # Load game-level data (use 2024 for now, switch to 2025 later)
> games <- load_schedules(2024)
> 
> # Filter to Chiefs games only (home OR away)
> chiefs_games <- games %>%
+   filter(home_team == "KC" | away_team == "KC")
> 
> # Save as CSV on Desktop
> write.csv(
+   chiefs_games,
+   file = "~/Desktop/chiefs_2025_games_whole.csv",  # adjust year as needed
+   row.names = FALSE
+ )
> 
> chiefs_games
── nflverse games and schedules ───────────────────────────────────────────────────────────────
ℹ Data updated: 2026-02-04 16:32:36 CST
# A tibble: 20 × 46
   game_id       season game_type  week gameday weekday gametime away_team away_score home_team
   <chr>          <int> <chr>     <int> <chr>   <chr>   <chr>    <chr>          <int> <chr>    
 1 2024_01_BAL_…   2024 REG           1 2024-0… Thursd… 20:20    BAL               20 KC       
 2 2024_02_CIN_…   2024 REG           2 2024-0… Sunday  16:25    CIN               25 KC       
 3 2024_03_KC_A…   2024 REG           3 2024-0… Sunday  20:20    KC                22 ATL      
 4 2024_04_KC_L…   2024 REG           4 2024-0… Sunday  16:25    KC                17 LAC      
 5 2024_05_NO_KC   2024 REG           5 2024-1… Monday  20:15    NO                13 KC       
 6 2024_07_KC_SF   2024 REG           7 2024-1… Sunday  16:25    KC                28 SF       
 7 2024_08_KC_LV   2024 REG           8 2024-1… Sunday  16:25    KC                27 LV       
 8 2024_09_TB_KC   2024 REG           9 2024-1… Monday  20:15    TB                24 KC       
 9 2024_10_DEN_…   2024 REG          10 2024-1… Sunday  13:00    DEN               14 KC       
10 2024_11_KC_B…   2024 REG          11 2024-1… Sunday  16:25    KC                21 BUF      
11 2024_12_KC_C…   2024 REG          12 2024-1… Sunday  13:00    KC                30 CAR      
12 2024_13_LV_KC   2024 REG          13 2024-1… Friday  15:00    LV                17 KC       
13 2024_14_LAC_…   2024 REG          14 2024-1… Sunday  20:20    LAC               17 KC       
14 2024_15_KC_C…   2024 REG          15 2024-1… Sunday  13:00    KC                21 CLE      
15 2024_16_HOU_…   2024 REG          16 2024-1… Saturd… 13:00    HOU               19 KC       
16 2024_17_KC_P…   2024 REG          17 2024-1… Wednes… 13:00    KC                29 PIT      
17 2024_18_KC_D…   2024 REG          18 2025-0… Sunday  16:25    KC                 0 DEN      
18 2024_20_HOU_…   2024 DIV          20 2025-0… Saturd… 16:30    HOU               14 KC       
19 2024_21_BUF_…   2024 CON          21 2025-0… Sunday  18:30    BUF               29 KC       
20 2024_22_KC_P…   2024 SB           22 2025-0… Sunday  18:30    KC                22 PHI      
# ℹ 36 more variables: home_score <int>, location <chr>, result <int>, total <int>,
#   overtime <int>, old_game_id <chr>, gsis <int>, nfl_detail_id <chr>, pfr <chr>, pff <int>,
#   espn <chr>, ftn <int>, away_rest <int>, home_rest <int>, away_moneyline <int>,
#   home_moneyline <int>, spread_line <dbl>, away_spread_odds <int>, home_spread_odds <int>,
#   total_line <dbl>, under_odds <int>, over_odds <int>, div_game <int>, roof <chr>,
#   surface <chr>, temp <int>, wind <int>, away_qb_id <chr>, home_qb_id <chr>,
#   away_qb_name <chr>, home_qb_name <chr>, away_coach <chr>, home_coach <chr>, …
> 