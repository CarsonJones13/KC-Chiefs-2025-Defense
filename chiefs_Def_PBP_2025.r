# Create a clean Chiefs defensive dataset
> chiefs_def_clean <- chiefs_def %>%
+   select(all_of(final_def_fields))
> 
> chiefs_def_clean
── nflverse play by play data ─────────────────────────────────────────────────────────────────
ℹ Data updated: 2025-09-03 04:24:26 CDT
# A tibble: 1,622 × 162
   game_id        play_id season  week   qtr play_type yardline_100  down ydstogo yards_gained
   <chr>            <dbl>  <int> <int> <dbl> <chr>            <dbl> <dbl>   <dbl>        <dbl>
 1 2024_01_BAL_KC      43   2024     1     1 kickoff             35    NA       0            0
 2 2024_01_BAL_KC      60   2024     1     1 run                 70     1      10            2
 3 2024_01_BAL_KC      82   2024     1     1 no_play             68     2       8            0
 4 2024_01_BAL_KC     118   2024     1     1 pass                73     2      13            2
 5 2024_01_BAL_KC     148   2024     1     1 pass                71     3      11           18
 6 2024_01_BAL_KC     183   2024     1     1 run                 53     1      10            1
 7 2024_01_BAL_KC     205   2024     1     1 pass                52     2       9            0
 8 2024_01_BAL_KC     239   2024     1     1 no_play             52     3       9           NA
 9 2024_01_BAL_KC     273   2024     1     1 pass                52     3       9           19
10 2024_01_BAL_KC     298   2024     1     1 run                 33     1      10            6
# ℹ 1,612 more rows
# ℹ 152 more variables: air_yards <dbl>, yards_after_catch <dbl>, opp_safety_prob <dbl>,
#   safety_prob <dbl>, epa <dbl>, total_home_epa <dbl>, total_away_epa <dbl>,
#   total_home_rush_epa <dbl>, total_away_rush_epa <dbl>, total_home_pass_epa <dbl>,
#   total_away_pass_epa <dbl>, air_epa <dbl>, yac_epa <dbl>, comp_air_epa <dbl>,
#   comp_yac_epa <dbl>, total_home_comp_air_epa <dbl>, total_away_comp_air_epa <dbl>,
#   total_home_comp_yac_epa <dbl>, total_away_comp_yac_epa <dbl>, …
# ℹ Use `print(n = ...)` to see more rows, and `colnames()` to see all variable names
> library(nflreadr)
> library(dplyr)
> library(stringr)
> 
> # 1. Load play-by-play (use 2024 for now, 2025 once available)
> pbp <- load_pbp(2024)
> 
> # 2. Filter to Chiefs defensive plays
> chiefs_def <- pbp %>%
+   filter(defteam == "KC")
> 
> # 3. Auto-select defensive-relevant fields
> def_keywords <- c(
+   "sack", "tackle", "qb_hit", "interception", "pass_defense",
+   "fumble", "forced", "recovery", "safety", "return_touchdown",
+   "rush_attempt", "pass_attempt", "yards_gained", "epa", "wpa",
+   "air_yards", "yards_after_catch", "success", "down", "ydstogo",
+   "yardline_100", "first_down", "third_down", "fourth_down"
+ )
> 
> def_fields <- names(chiefs_def)[
+   str_detect(names(chiefs_def), paste(def_keywords, collapse = "|"))
+ ]
> 
> context_fields <- c("game_id", "play_id", "season", "week", "qtr", "play_type")
> 
> final_def_fields <- unique(c(context_fields, def_fields))
> 
> chiefs_def_clean <- chiefs_def %>%
+   select(all_of(final_def_fields))
> 
> # 4. Save to Desktop as a CSV
> write.csv(
+   chiefs_def_clean,
+   file = "~/Desktop/chiefs_2025_defense_whole.csv",  # adjust path if needed
+   row.names = FALSE
+ )
> library(nflreadr)
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
