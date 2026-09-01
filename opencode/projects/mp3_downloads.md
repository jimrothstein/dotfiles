#  /home/jim/mp3_downloads

Personal music/podcast download directory (~4981 files, mostly `.ogg`; some `.mp3`/`.m4a`/`.ogx`/`.opus`/`.webm`). Contains accumulated duplicates from repeated batch downloads (same song, different date suffix or separator style).

## PLAN

### Done
- 2026-08-16: Duplicate scan. Parsed all 5092 filenames into canonical song names (lowercase, strip extension + batch-date suffix, collapse separators), grouped by (canonical name, exact byte size) → 168 candidate clusters / 344 files. Verified with MD5 → only groups where content is byte-identical were kept.
- 2026-08-16: Wrote `duplicate_report.md` (56 true duplicate clusters, 113 files involved). Report only — no deletions.
- 2026-08-16: Wrote plan to `~/code/docs/000_duplicate_music_plan.md`.
- 2026-08-17: User reviewed `duplicate_report.md` and approved deletion (keep MIME/newest per cluster). All 56 clusters re-verified with MD5 (canonical name + byte size + identical MD5), then 57 duplicate files (146 MB) moved to `/tmp/opencode/mp3_dup_removed_2026-08-17/` (recoverable staging, not hard-deleted). Directory now 5037 entries; re-scan confirms 0 duplicate clusters.
- 2026-08-17: User spotted a missed duplicate (`ANGEL_BABY_Kathy_Young`). Original date-suffix stripping covered only `_2021-10-27`, `_08Sep2020`, `_02Feb2022` styles; a second, broader scan (also stripping `_YYYY_MM_DD`, `_DD_Mmm_YYYY`, `_ddmmyyyy`, run-style suffixes) found 33 more true-duplicate clusters / 33 files (95.4 MB, MD5-verified, content identical). Same policy applied (keep MIME/newest); moved to staging. Final state: 90 files staged over two passes (241.5 MB), directory now 5004 entries, scan reports 0 clusters. A final over-broad "also drop trailing year" scan also confirms 0.
- 2026-08-17: Near-duplicate scan (new): groups files by canonical song name, flags clusters containing any pair whose byte sizes differ by 1..209715 B (0.2 MB). Found 75 clusters / 189 files. Output written as checkbox list under TODO (check `[X]` = delete that file, `[ ]` = keep). NOT MD5-verified and NOT deleted — user will mark choices next session. Same canonicalization script as before (`/tmp/opencode/near_dup_scan.py`); sizes held constant because canonical-name grouping already matches before checking the size window.
- 2026-08-19: User reviewed the near-duplicate TODO checklist and marked `[X]` on 23 files across 18 clusters. All 23 verified present and moved (recoverable staging, not hard-deleted) to `/tmp/opencode/near_dup_removed_2026-08-19/` (72.6 MB). Directory 5004 → 4981 entries. Every affected cluster still keeps ≥1 member. Remaining untouched clusters still all `[ ]` (138 files candidate rows remain). Checklist in this file was double-listed (numbered + redundant plain copy); copy removed and cluster `(N files)` counts re-derived to match actual rows.
- 2026-08-23: Second near-dup removal pass. User marked `[X]` on 41 files total (the earlier 23 had been restored to the directory — the 2026-08-19 staging dir no longer exists, /tmp was cleared). All 41 existence+size verified, then moved (recoverable staging) to `/tmp/opencode/near_dup_removed_2026-08-23/` (112,320,362 B ≈ 107 MB). Directory 4981 → 4940 entries. Verified all 75 clusters still keep ≥1 `[ ]` member and no `[X]` file remains on disk; 97 unchecked candidate files remain. NOTE: `/tmp` staging dirs must NOT be deleted by opencode — Jim handles their cleanup himself.

### TODO
- 97 near-duplicate candidate files remain unchecked (`[ ]`) across the 75 clusters below. Per 2026-08-23 policy: files marked `[X]` are deleted (staged); `[ ]` files are left untouched. All current `[X]` marks have been processed — remaining rows await future review.
1. **alma cogan so f ngt es immer an** (1 files)
   - [ ] 4237705  Alma Cogan -So fängt es immer an_15Nov2024.ogg
2. **american bandstand 1957 1968 blue christmas elvis presley** (1 files)
   - [ ] 2192145  American Bandstand 1957 & 1968 – Blue Christmas, Elvis Presley_15Nov2024.ogg
3. **anita bryant fly me to the moon on the ed sullivan show** (2 files)
   - [X] 1529866  Anita Bryant ＂Fly Me To The Moon＂ on The Ed Sullivan Show_24Feb2026.ogg
   - [ ] 1529986  Anita Bryant ＂Fly Me To The Moon＂ on The Ed Sullivan Show_24Jan2025.ogg
4. **barbara bonney geoffrey parsons ave maria op 52 no 6 d 839** (2 files)
   - [X] 6663143  Barbara Bonney, Geoffrey Parsons_Ave Maria, Op. 52 No. 6, D. 839_27Jan2025.ogg
   - [ ] 6663144  Barbara Bonney, Geoffrey Parsons_Ave Maria, Op. 52 No. 6, D. 839_28Oct2023.ogg
5. **bonnie owens how many** (1 files)
   - [ ] 2671808  Bonnie_Owens_How_Many_24MAR2019.ogg
6. **connie francis ray conniff love is a many splendored thing stereo lyrics** (2 files)
   - [ ] 5259524  Connie Francis ⧸ Ray Conniff - Love Is A Many-Splendored Thing (Stereo ⧸ Lyrics)_20Jul2025.ogg
   - [ ] 5407565  Connie_Francis___Ray_Conniff_-_Love_Is_A_Many-Splendored_Thing_(Stereo___Lyrics)_23Aug2022.ogg
7. **connie francis where the boys are** (2 files)
   - [ ] 2717785  Connie_Francis_Where_the_boys_are.ogg
   - [ ] 2771169  Connie Francis   Where the boys are_15Feb2026.ogg
8. **connie smith if i talk to him** (1 files)
   - [ ] 1633744  Connie_Smith_If_I_Talk_to_Him_01Aug2020.ogg
9. **connie smith whispering hope album young love** (1 files)
   - [ ] 4439842  Connie_Smith_whispering_hope._Album_Young_Love_01Aug2020.ogg
10. **connie tyler connie tyler sandor micheller dial m for maybe** (1 files)
   - [ ] 3595750  Connie Tyler, Connie Tyler, Sandor Micheller_Dial M For Maybe_15Feb2026.ogg
11. **crazy for you susanna and the roomates** (1 files)
   - [ ] 2209250  Crazy_for_you_Susanna_and_the_Roomates_12_Apr_2020.ogg
12. **crystal gayle first tv 1970 ribbon of darkness over me** (2 files)
   - [X] 5671037  Crystal_Gayle_First_TV_1970_ribbon_of_darkness_over_me_2019_04_06_06_Apr_2019.ogg
   - [ ] 5793528  Crystal Gayle First TV 1970 - ribbon of darkness over me_17Oct2023.ogg
13. **dana never gonna fall in love again 1976 fod 62** (2 files)
   - [ ] 2702814  DANA_Never_Gonna_Fall_in_Love_Again_1976_(FoD#62)_29Jan2021.ogg
   - [X] 2766149  DANA Never Gonna Fall in Love Again 1976 (FoD#62)_07Jul2023.ogg
14. **diana trask a guy is a guy sing along with mitch miller** (2 files)
   - [ ] 2416331  Diana_Trask_A_Guy_Is_A_Guy_(Sing_Along_with_Mitch_Miller)_08Sep2020.ogg
   - [X] 2565374  Diana Trask -  A Guy Is A Guy (Sing Along with Mitch Miller)_28Oct2023.ogg
15. **die himmel erz hlen die ehre gottes heinrich sch tz k rntner landesjugendchor** (1 files)
   - [ ] 5098026  Die Himmel erzählen die Ehre Gottes (Heinrich Schütz) - Kärntner Landesjugendchor_24Jan2025.ogg
16. **doris day s wonderful from starlift 1951** (1 files)
   - [ ] 3111833  Doris Day - ＂'S Wonderful＂ from Starlift (1951)_28Oct2023.ogg
17. **es f hrt ber den main volksweise satz stefan claas k rntner landesjugendchor** (2 files)
   - [X] 5527081  Es führt über den Main (Volksweise, Satz： Stefan Claas) – Kärntner Landesjugendchor_24Jan2025.ogg
   - [ ] 5527094  Es führt über den Main (Volksweise, Satz： Stefan Claas) – Kärntner Landesjugendchor_28Oct2023.ogg
18. **evie sands angel of the morning** (2 files)
   - [ ] 2669037  Evie_Sands_Angel_Of_The_Morning_01Aug2020.ogg
   - [X] 2786923  Evie Sands_Angel Of The Morning_28Oct2023.ogg
19. **four tops reach out i ll be there on the ed sullivan show** (2 files)
   - [ ] 2795733  Four_Tops__Reach_Out_I_ll_Be_There__on_The_Ed_Sullivan_Show_08Sep2020.ogg
   - [X] 2871653  Four Tops ＂Reach Out I'll Be There＂ on The Ed Sullivan Show_06Jul2023.ogg
20. **fran warren medley of songs 1950** (1 files)
   - [ ] 3877273  Fran Warren - Medley of Songs (1950)_17Oct2023.ogg
21. **hank snow wabash cannonball** (1 files)
   - [ ] 2273493  Hank_Snow_Wabash_Cannonball_2019_03_03_19FEB2019.ogg
22. **he 1955 kay armen** (1 files)
   - [ ] 3624435  He (1955) - Kay Armen_24Feb2026.ogg
23. **heidi br hl das kann morgen vorbei sein 1961** (2 files)
   - [X] 1953290  Heidi Brühl - Das Kann Morgen Vorbei Sein(1961)_27Jan2025.ogg
   - [ ] 1953291  Heidi Brühl - Das Kann Morgen Vorbei Sein(1961)_17Oct2023.ogg
24. **heidi br hl jeder mann braucht ein bisschen liebe 1959 filmausschnitt** (2 files)
   - [X] 1433501  Heidi Brühl - Jeder Mann braucht ein bisschen Liebe  1959  (Filmausschnitt)_27Jan2025.ogg
   - [ ] 1551156  Heidi Brühl - Jeder Mann braucht ein bisschen Liebe  1959  (Filmausschnitt)_17Oct2023.ogg
25. **i love melvin all i do is dream of you** (2 files)
   - [X] 1629872  I_Love_Melvin_[All_I_Do_Is_Dream_Of_You]_04Jul2022.ogg
   - [ ] 1639220  I_Love_Melvin_[All_I_Do_Is_Dream_Of_You]_02Feb2022.ogg
26. **in the sweet bye and bye loretta lynn** (2 files)
   - [X] 2500754  in the sweet bye and bye ＂loretta lynn＂_17Oct2023.ogg
   - [ ] 2503240  in_the_sweet_bye_and_bye_loretta_lynn_01Aug2020.ogg
27. **jacqueline boyer butterfly soeben eingetroffen** (2 files)
   - [ ] 2020542  Jacqueline Boyer - Butterfly (Soeben eingetroffen, 22.06.1965)_20Jul2025.ogg
   - [ ] 2162144  Jacqueline Boyer - Butterfly (Soeben eingetroffen, 22.06.1965)_09Feb2025.ogg
28. **jane morgan red sails in the sunset bless em all 1963 tv** (1 files)
   - [ ] 3226877  Jane Morgan--Red Sails in the Sunset, Bless 'Em All, 1963 TV_26Jun2023.ogg
29. **jane powell it s a most unusual day on the ed sullivan show** (2 files)
   - [X] 1203355  Jane Powell ＂It's A Most Unusual Day＂ on The Ed Sullivan Show_20Jul2025.ogg
   - [ ] 1324800  Jane Powell ＂It's A Most Unusual Day＂ on The Ed Sullivan Show_19Oct2023.ogg
30. **joan baez just a closer walk with thee** (2 files)
   - [ ] 3924981  ~ JOAN BAEZ ~ Just A Closer Walk With Thee ~.mp3
   - [ ] 4090598  JOAN_BAEZ_Just_A_Closer_Walk_With_Thee_~.ogg
31. **jody miller be my man david gates 1965** (2 files)
   - [X] 2163464  Jody_Miller_-_BE_MY_MAN_(David_Gates)_(1965)_18Aug2022.ogg
   - [ ] 2191092  Jody_Miller_BE_MY_MAN_(David_Gates)_(1965)_08Sep2020.ogg
32. **judith durham this is my song in stereo** (2 files)
   - [ ] 2310165  Judith Durham ~ _This Is My Song_    in Stereo.mp3
   - [ ] 2505764  Judith_Durham_This_Is_My_Song_in_Stereo.ogg
33. **judy stone all alone am i** (1 files)
   - [ ] 2516578  Judy_Stone_All_Alone_Am_I_20May2020.ogg
34. **judy stone you don t know** (2 files)
   - [ ] 2695578  ♫  Judy Stone  ★ You Don't Know ♫_07Jul2023.ogg
   - [ ] 2696592  Judy_Stone_You_Don_t_Know_29Jan2021.ogg
35. **judy stone your used to be** (1 files)
   - [ ] 1838860  Judy_Stone_Your_Used_To_Be_20May2020.ogg
36. **juliette gr co sous le ciel de paris 1951** (2 files)
   - [X] 3438876  Juliette Gréco - Sous le ciel de Paris ( 1951 )_20Jul2025.ogg
   - [ ] 3474241  Juliette Gréco - Sous le ciel de Paris ( 1951 )_09Feb2025.ogg
37. **kathy linden cowell it s just my luck to be fifteen** (2 files)
   - [X] 1946222  Kathy Linden, Cowell_It's Just My Luck to Be Fifteen_15Nov2024.ogg
   - [ ] 1946223  Kathy Linden, Cowell_It's Just My Luck to Be Fifteen_06Jul2023.ogg
38. **katy b dtger butterfly** (2 files)
   - [ ] 3443592  Katy Bødtger - Butterfly_24Jan2025.ogg
   - [ ] 3443593  Katy Bødtger - Butterfly_17Oct2023.ogg
39. **katy b dtger dominique 1963** (2 files)
   - [ ] 2949748  Katy Bødtger - Dominique  -1963_24Jan2025.ogg
   - [ ] 2994037  Katy Bødtger - Dominique  -1963_17Oct2023.ogg
40. **kiki dee why don t i run away from you 1966 rare clip** (2 files)
   - [ ] 2046118  Kiki Dee   Why Don't I Run Away From You 1966 Rare Clip!_15Nov2024.ogg
   - [ ] 2047064  Kiki_Dee_Why_Don_t_I_Run_Away_From_You_1966_Rare_Clip!_08Sep2020.ogg
41. **lavern baker if you love me 1957** (2 files)
   - [X] 2256719  Lavern Baker - If You Love Me (1957)_22Feb2025.ogg
   - [ ] 2269637  Lavern Baker - If You Love Me (1957)_21Jul2025.ogg
42. **lavern baker precious memories 1957** (2 files)
   - [X] 2978103  Lavern Baker - Precious Memories (1957)_22Feb2025.ogg
   - [ ] 3066877  Lavern Baker - Precious Memories (1957)_21Jul2025.ogg
43. **linda scott to each his own 1962** (2 files)
   - [ ] 2024919  Linda_Scott_To_Each_His_Own_(1962)_2019-05-28.ogg
   - [ ] 2071520  Linda_Scott_To_Each_His_Own_(1962)_2020-02-17.ogg
44. **liv maessen liv maessen snowbird 1960s** (2 files)
   - [X] 1498341  Liv_Maessen_Liv_Maessen_Snowbird_(1960s)_2021-06-08.ogg
   - [ ] 1653700  Liv_Maessen_Liv_Maessen_Snowbird_(1960s)_2020-02-17.ogg
45. **lobo me and you and a dog named boo lobo** (2 files)
   - [X] 3048309  Lobo_Me_and_you_and_a_dog_named_Boo_Lobo.mp3
   - [ ] 3120795  Lobo_Me_and_you_and_a_dog_named_Boo_Lobo.ogg
46. **loretta lynn loretta lynn im living in two worlds** (2 files)
   - [X] 2723069  Loretta_Lynn_Loretta_Lynn_Im_living_in_two_worlds_2019_04_06_06_Apr_2019.ogg
   - [ ] 2805062  Loretta_Lynn_Loretta_Lynn_Im_living_in_two_worlds_2019-08-05.ogg
47. **loretta lynn where no one stands alone** (2 files)
   - [X] 1773317  loretta_lynn__where_no_one_stands_alone__08Sep2020.ogg
   - [ ] 1921737  loretta lynn ＂where no one stands alone＂_17Oct2023.ogg
48. **mary duff will you walk with me** (2 files)
   - [X] 3620998  Mary Duff   Will You Walk With Me_09Feb2025.ogg
   - [ ] 3824242  Mary Duff_Will You Walk With Me_28Oct2023.ogg
49. **my girl the temptations** (2 files)
   - [ ] 1204533  My_Girl_The_Temptations.mp3
   - [ ] 1325038  My_Girl_The_Temptations.ogg
50. **na new i hear a symphony the supremes stereo 1965** (2 files)
   - [X] 3120414  NA_NEW ＊ I Hear A Symphony - The Supremes {Stereo} 1965_10AUG2026.ogg
   - [ ] 3130529  NA_NEW ＊ I Hear A Symphony - The Supremes {Stereo} 1965_08Aug2026.ogg
51. **norma jean my babys not here tonight** (2 files)
   - [X] 2435035  Norma_Jean_My_Babys_Not_Here_Tonight_12_Apr_2020.ogg
   - [ ] 2439368  Norma Jean - My Babys Not Here Tonight_17Oct2023.ogg
52. **paper dolls the paper dolls darlin the beach boys** (2 files)
   - [X] 2059466  Paper_Dolls_The_Paper_Dolls_Darlin`_(_The_Beach_Boys_)_2021-06-11.ogg
   - [ ] 2123520  Paper_Dolls_The_Paper_Dolls_Darlin`_(_The_Beach_Boys_)_2020-02-17.ogg
53. **pat carroll all kinds of everything** (2 files)
   - [ ] 2785694  ♫ Pat Carroll ★ All Kinds Of Everything ♫_17Oct2023.ogg
   - [ ] 2789995  Pat_Carroll_All_Kinds_Of_Everything_13Jul2020.ogg
54. **pat carroll our day will come 1963** (2 files)
   - [ ] 2322481  Pat Carroll – Our Day Will Come (1963)_17Oct2023.ogg
   - [ ] 2330051  Pat_Carroll_Our_Day_Will_Come_(1963)_13Jul2020.ogg
55. **patti mcgrath end of the world bandstand** (2 files)
   - [ ] 1988043  ♫ Patti McGrath ★ End of The World ♫  (Bandstand)_20Jul2025.ogg
   - [ ] 2015996  Patti_McGrath_End_of_The_World_(Bandstand)_12_Apr_2020.ogg
56. **patti page unchained melody 1966 tv** (3 files)
   - [X] 2600425  Patti_Page--Unchained_Melody_1966_TV_2019-10-13.ogg
   - [ ] 2604448  Patti Page--Unchained Melody, 1966 TV_24Feb2026.ogg
   - [ ] 2604448  Patti Page--Unchained Melody, 1966 TV_15Feb2026.ogg
57. **patty duke patty duke one kiss away** (2 files)
   - [X] 3262745  Patty_Duke_Patty_Duke_One_Kiss_Away_29Jan2021.ogg
   - [ ] 3265395  Patty_Duke_Patty_Duke_One_Kiss_Away_04JAN2019.ogg
58. **peggy march wenn teenager tr umen die goldigen f nfziger** (2 files)
   - [X] 1092613  Peggy March - Wenn Teenager träumen (Die goldigen Fünfziger, 03.01.1974)_24Jan2025.ogg
   - [ ] 1092614  Peggy March - Wenn Teenager träumen (Die goldigen Fünfziger, 03.01.1974)_17Oct2023.ogg
59. **remembering wilma lee cooper** (2 files)
   - [X] 2057379  Remembering_Wilma_Lee_Cooper_08Sep2020.ogg
   - [ ] 2160459  Remembering Wilma Lee Cooper_07Jul2023.ogg
60. **rex allen get along home cindy** (3 files)
   - [ ] 1545543  Rex_Allen__Get_Along_Home_Cindy__2021-06-11.ogg
   - [ ] 1557614  Rex_Allen__Get_Along_Home_Cindy__2021-10-27.ogg
   - [X] 1557614  Rex Allen 'Get Along Home Cindy'_2021-10-27_.ogg
61. **rickie page i cry inside 1965** (2 files)
   - [X] 2021144  Rickie_Page_I_CRY_INSIDE_(1965)_2019-07-06.ogg
   - [ ] 2206243  Rickie_Page_I_CRY_INSIDE_(1965)_2021-04-07.ogg
62. **sandy stewart some of these days 1961** (2 files)
   - [X] 2259598  Sandy_Stewart__Some_of_These_Days__(1961)_2021-10-27.ogg
   - [ ] 2385476  Sandy_Stewart_Some_of_These_Days_(1961)_15Jun2020.ogg
63. **save the last dance for me the drifters** (2 files)
   - [ ] 2553738  Save_the_last_dance_for_me_The_Drifters.ogg
   - [ ] 2610258  Save the last dance for me - The Drifters.mp3
64. **skeeter davis he left his heart with me** (2 files)
   - [ ] 2164354  Skeeter_Davis_He_Left_His_Heart_With_Me_08Sep2020.ogg
   - [X] 2229137  Skeeter Davis - He Left His Heart With Me_17Oct2023.ogg
65. **skeeter davis i really want you to know** (3 files)
   - [X] 2532160  Skeeter_Davis_I_Really_Want_You_To_Know_15Jun2020.ogg
   - [ ] 2532160  Skeeter_Davis_I_Really_Want_You_To_Know_08Sep2020.ogg
   - [ ] 2686322  Skeeter_Davis_I_Really_Want_You_to_Know_08Sep2020.ogg
66. **some sunday morning from san antonio 1945** (2 files)
   - [ ] 2118800  Some Sunday Morning from San Antonio (1945)_15Nov2024.ogg
   - [X] 2118826  Some_Sunday_Morning_from_San_Antonio_(1945)_2021-04-07.ogg
67. **susan maughan hey lover live** (2 files)
   - [X] 1601323  Susan Maughan - Hey Lover (Live)_2021-12-13_.ogg
   - [ ] 1628683  Susan_Maughan_Hey_Lover_(Live)_08Sep2020.ogg
68. **the music man shirley jones till there was you** (2 files)
   - [ ] 3462228  The_Music_Man_Shirley_Jones__Till_There_Was_You__2021-06-08.ogg
   - [ ] 3619512  The_Music_Man_Shirley_Jones_Till_There_Was_You_22JAN2019.ogg
69. **the original stroll february 1958** (2 files)
   - [X] 1200643  The_Original_Stroll_February_1958.mp3
   - [ ] 1393726  The_Original_Stroll_February_1958.ogg
70. **the paris sisters dream lover** (2 files)
   - [ ] 3801292  The_Paris_Sisters_Dream_Lover_08Sep2020.ogg
   - [ ] 3928380  The Paris Sisters ＂Dream Lover＂_17Oct2023.ogg
71. **the paris sisters i love how you love me the original version played on a 1954 seeburg jukebox** (2 files)
   - [X] 1205919  The_Paris_Sisters_I_Love_How_You_Love_Me_The_original_version_played_on_a_1954_Seeburg_jukebox.ogg
   - [ ] 1264771  The_Paris_Sisters_I_Love_How_You_Love_Me_The_original_version_played_on_a_1954_Seeburg_jukebox_15Jun2020.ogg
72. **the seekers just a closer walk with thee** (2 files)
   - [ ] 2155533  The Seekers - Just A Closer Walk With Thee.mp3
   - [ ] 2314651  The_Seekers_Just_A_Closer_Walk_With_Thee.ogg
73. **till there was you anita bryant 1959** (2 files)
   - [ ] 2343795  Till_There_Was_You_Anita_Bryant_(1959)_12_Apr_2020.ogg
   - [ ] 2465099  TILL_THERE_WAS_YOU_Anita_Bryant_1959_08Sep2020.ogg
74. **vera lynn a nightingale sang in berkeley square 1969** (2 files)
   - [X] 2971283  Vera_Lynn_A_Nightingale_Sang_In_Berkeley_Square_[1969]_2019-08-05.ogg
   - [ ] 3071325  Vera_Lynn_A_Nightingale_Sang_In_Berkeley_Square_[1969]_2019-07-06.ogg
75. **walk on by the story of popular song stardust the jazz singers** (2 files)
   - [ ] 11445064  Walk_On_By_The_Story_Of_Popular_Song_(Stardust_The_Jazz_Singers)_08Sep2020.ogg
   - [X] 11445222  Walk On By - The Story Of Popular Song (Stardust - The Jazz Singers)_15Nov2024.ogg
## NEXT STEPS
- User continues reviewing the remaining near-duplicate clusters in TODO (all `[ ]`) and marks `[X]` on files to delete. Then we move the checked files (same policy: recoverable staging in `/tmp/opencode/`).
- `/tmp` staging directories (`near_dup_removed_2026-08-23/` with 41 files / 107 MB, and any older ones) are **Jim's responsibility to clean up** — opencode must not delete them.
- Staged true-duplicates in `/tmp/opencode/mp3_dup_removed_2026-08-17/` (90 files / 241.5 MB) already cleaned up (dir no longer exists).
- `duplicate_report.md` is historical (predates the 2026-08-17 deletions). Can be deleted or kept as-is.
- On 2026-08-17 the original plan file `~/code/docs/000_duplicate_music_plan.md` was deleted (marked obsolete by user). Plan contents are fully captured in this file, so nothing is lost.

## Method notes
- Duplicate definition (user-approved): same canonical song name AND byte-identical size, verified by MD5 content hash. Deliberately conservative (exact size only) to avoid false positives; fuzzy name-matching intentionally NOT done (too slow, more error-prone).
- Near-duplicate definition (2026-08-17, new): same canonical song name, byte sizes differ by 1..209715 B (0.2 MB). NOT MD5-verified — same title + near size usually means a re-encode (different bitrate/format), so pairs are candidates for user review, not auto-deletions.
- Surprising finding: many same-name+same-size pairs are NOT identical content (e.g. 3× Annette Funicello "Rock and Roll Waltz" all 1,454,520 B but different MD5). MD5 verification is essential.
- Batch-date suffix patterns stripped: `_08Sep2020`, `_2021-12-13_`, `_15Feb2026`, `_02Feb2022`, `_13Jul2020`, etc.
- Some duplicate twins lose their `.ogg` extension entirely (e.g. `Buddy_Johnson_and_His_Orchestra_Mush_Mouth_08Sep2020` vs `..._08Sep2020.ogg`).
