# Variables

* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `all_data`, `all_labels` and `all_subjects` merge the previous datasets to further analysis.
* `features` contains the correct names for the `all_data` dataset, which are applied to the column names stored in `features_colno`, a numeric vector used to extract the desired data.
* A similar approach is taken with activity names through the `activity_labels` variable.
* `all_data` is added with column names
* Finally, `averages_data` contains the relevant averages which will be later stored in a `.txt` file. `ddply()` from the plyr package is used to apply `colMeans()` and ease the development.
