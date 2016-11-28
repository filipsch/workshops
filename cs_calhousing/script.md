By now it should be pretty clear: Python is a superpowerful tool for Data Science. My name is Filip, I'm a content developer at DataCamp, and In this video, I'll walk you through a machine learning problem with some real data, step by step.

Imagine this situation: you're a policy maker in California, and you want to figure out what drives the value of real estate. From the state's archives, you find data on thousands of different areas: Apart from the median value of houses in that area, you know the location, so latitude and longitude, how many people and households are living there, what these people typically earn, et cetera et cetera. It's very probable that there is a relationship between all these different pieces of information.

More specifically, you can build a model that takes all these variables for a specific area in California as inputs, and can then estimate the median value of houses in that area for you.

Of course, we first have to actually build this model, and see if it's any good. With Python, this is really easy, and there's a typical recipe to follow: First, you'll have to import your data into Python. Second, you'll have to prepare your data for modelling. Next, it's time to actually build, or train, your model based on the data. Then, you should test your model to see if actually works properly. Finally, you are ready to interpret your model.

If this all sounds a bit vague to you, don't worry: it's time to head over to the Python console and to see how it's done in practice. I will not explain each letter of Python code here, just try to understand the meaning of each step.

To open up the Python console, I go to the terminal and type `python3`. I'll be working with python version 3, and not with version 2 that's still widely used. A python shell opens up where I can type python commands. 

The first step is importing the data into our Python session. If you look at the data in `cal_housing.csv`, right here, there's a tabular structure. Each row is an observation, and each column is a certain variable of the dataset. The names of these variables can be found from the first line: the first column corresponds to median house value, the second to the age of the houses, and so on. 

To get this data inside python, you'll need a suitable data structure for tabular data: the pandas data frame. Pandas is one of these python packages Jonathan talked about before. To use it, I'll have to load it, like this. 

I can now use the function read underscore csv, and refer to the csv file.

There's a data frame `df` now, with all data from the csv file. You can see from the printout, that the names are already in there. df.shape tells you that the dataframe contains more than 20.000 observations, and nine columns, or variables.

Next up is preparing your data for analysis. You typically only use a part of the dataset to build, or train the model. That way, you still have some data left to test whether the model you come up with is actually any good. 

To split up the data in this so called training and test set, I'm going to use the cross validation module from scikitlearn, which is a powerful package to do all kinds of machine learning magic in Python. This call splits the Pandas data frame randomly into two parts: train and test. The training set contains 80\% of the observations, and the test set 20\%.

Our model takes inputs, and generates an output, but at the moment these are all in the same data set. You'll have to chop things up to be able to train our model later on. To do this, I use these two lines of code to make two lists, containing the names of the input and output variables. MedHouseValue is the first column, which I can access with index 0. The other column names, from index 1 to the end, will be the inputs variables.

Now, I can use these two lists of names, to split up the train and test data frame. Four pieces of data result: in_train, out_train, in_test and out_test. 

So importing: check. Preparing: check. Time to model this thing! I'll be using the ensemble module, also from scikitlearn. More specifically, I'll be using Gradient Boosting Regression, which is a fairly complicated machine learning algorithm that often does a good job without too much tweaking. The cool thing is, that you don't have to understand how it works exactly, you just have to know how to use it in Python.

Let me first create a dictionary, which is a set of key-value pairs, with some parameters that the model needs. Next, I build a gradient boosting regressor with these parameters, and then fit the model, with in_train, the input data of the training set, and out_train, the output of the training set.

This can take some time to run, because a lot of calculations are happening in the background. The result is `clf`, a trained model that can predict the median house value for a set of input variables.

To see whether this model actually works, you can predict median house values on data that the model hasn't seen yet. This is where the test set comes in: I call the predict method on clf, and pass along the `in_test` data, so the test set with the input data. The output, which I've called out_predict here, should match out_test, the actual median houses values in the test set, as close as possible. The closer out_predict and out_test are, the better.

To see if they are indeed close, I'm going to use the matplotlib package to create a fancy plot. I had to do some data juggling here to sort the values in ascending order and convert some of the Python types. <PAUSE> Anyways, the result is this pretty slick plot: the red dots represent the actual median house values for all different areas, in ascending order. The blue dots represent the estimated house values for those areas. The smaller the vertical distance between the blue dots and the red line, the better our prediction was. I think the results are pretty satisfying for a first try!

You might ask yourself: which one of the input variables in the dataset had the most impact on the house value? This chunk of code <PAUSE> creates a plot for us to check this out: It appears that median income is the greatest influencer on house prices followed by longitude and latitude.

This is pretty awesome: with around 30 lines of python code, I can get data, clean it up, train a model, test it, and interpret it. That's the true power of Python packages at work here. However, having to write things line by line in the console can be pretty frustrating. What if you want to change a parameter here and there, and rebuild your model and the corresponding plots? You'd have to retype every line, one by one. But there's a solution: the Python script. You can simply put all the Python code you've written in a simple text file with the extension dot pee why, housing dot pee why for example, like I did here. You can clearly see the different steps of the process. Next, you can head over to the terminal and execute python3 housing.py. Each line of code in the script is executed one after the other, as if you're typing it yourself. This time, though, it's easy to change some parameters and run the entire thing again with a single command.

We're at the end of my quick tour through a modeling example with Python. Of course, this was a high-level flight over all the Python code. If you want to become a Python programmer yourself, there's much more to learn: take our free introduction to Python for data science course at datacamp.com!



