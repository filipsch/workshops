print("Importing data ... ")
import pandas as pd
df = pd.read_csv('cal_housing.csv')

print("Preparing data ... ")
from sklearn.cross_validation import train_test_split
train, test = train_test_split(df, test_size = 0.2)
out_names = df.columns[0]
in_names = df.columns[1:]
in_train = train[in_names]
out_train = train[out_names]
in_test = test[in_names]
out_test = test[out_names]

print("Train the model ... ")
from sklearn.ensemble import GradientBoostingRegressor
params = {'n_estimators': 500, 'max_depth': 6, 'learning_rate': 0.1, 'loss': 'huber','alpha':0.95}
clf = GradientBoostingRegressor(**params).fit(in_train, out_train)

print("Test the model (visualize) ... ")
out_predict = clf.predict(in_test)
import matplotlib.pyplot as plt
out_test_mat = out_test.as_matrix()
indices = sorted(range(len(out_test_mat)), key=lambda k: out_test_mat[k])
plt.plot(out_test_mat[indices], 'r.')
plt.plot(out_predict[indices], 'b.')
plt.show()

print("Build plot to interpret variable importance ... ")
import numpy as np
variable_importance = clf.feature_importances_
variable_importance = 100.0 * (variable_importance / variable_importance.max())
sorted_idx = np.argsort(variable_importance)
pos = np.arange(sorted_idx.shape[0]) + .5
plt.figure(figsize=(12, 6))
plt.subplot(1, 1, 1)
plt.barh(pos, variable_importance[sorted_idx], align='center')
plt.yticks(pos, in_names[sorted_idx])
plt.xlabel('Relative Importance')
plt.title('Variable Importance')
plt.show()












