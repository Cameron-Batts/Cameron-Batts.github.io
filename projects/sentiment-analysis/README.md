# Sentiment Analysis Comparison for Decision Support

**Author:** Cameron Batts  
**Tools:** Python · pandas · scikit-learn · NLTK · TextBlob

## Business Problem
Text feedback can reveal service concerns that numerical ratings miss. This project compares sentiment methods on public tweets and considers their potential application to radiology patient feedback. No patient data or deployed business outcomes are represented.

## Project Approach
- Profile 20,000 public tweets from NLTK's Twitter samples.
- Train bag-of-words Naive Bayes and logistic regression on separate positive/negative tweet corpora.
- Compare model behavior with VADER, TextBlob, and emoticon matching.
- Examine sensitivity to added positive words.

## Key Results
The supplied run reported a mean text length of **121.51 characters** and a classifier vocabulary of **20,770 terms**. Emoticon matching found **482 positive matches** and **14 negative matches**, with overlap not measured in the original run.

Adding positive tokens to a negative sentence moved Naive Bayes positive probability from **0.222 to 0.904**, TextBlob polarity from **−1.0 to 0.3**, and VADER compound score from **−0.4767 to 0.9022**.

These are descriptive and illustrative results. No labeled holdout evaluation was performed; no accuracy ranking or healthcare improvement is claimed.

## Run
```bash
python -m pip install -r requirements.txt
jupyter lab notebooks/sentiment_analysis_comparison.ipynb
```
Run cells from top to bottom. The first run downloads `twitter_samples` and `vader_lexicon` from NLTK and requires internet access. Dependencies are unpinned; this portfolio conversion was syntax-checked but not re-executed. Selected original aggregate outputs remain in the notebook.

## Repository Structure
```text
notebooks/sentiment_analysis_comparison.ipynb
../../sentiment_analysis_comparison.html
requirements.txt
portfolio_card.html
README.md
```

## Data and Limitations
Source: NLTK `twitter_samples`, https://www.nltk.org/nltk_data/. Raw tweets are not bundled. Observe applicable corpus terms and attribution. Rerunning can display public third-party names and handles from the source data. The notebook removes saved tweet excerpts and local machine paths.

Classifier probabilities and lexicon polarity scores use different scales. Sarcasm, negation, mixed sentiment, domain shift, duplicate posts, and substring matching limit interpretation. Validate on labeled data before operational use.

## Author
Cameron Batts  
GitHub: https://github.com/Cameron-Batts  
Portfolio: https://cameron-batts.github.io
