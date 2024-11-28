import sys
import pandas as pd

files = sys.argv[1:]

def get_adar_edits(x):
    # if AllSubs isn't empty (from REDI) there was a detected base change
    adarE = x[ x["AllSubs"].str.contains('AG') | x["AllSubs"].str.contains('TC') ]
    #adarE = x[ (x["Reference"] == 'A') | (x["Reference"] == 'T') ]
    return adarE

def main():
    for file in files:

        print(file) #read file that is output from REDI
        df = pd.read_csv(file, sep="\t", chunksize=5000)
        edits = pd.DataFrame()
        c = 1
        for chunk in df:
            adar_edits = get_adar_edits(chunk)
            edits = pd.concat([edits, adar_edits])
            if c%1000==0:
                print(c)
            c+=1
        del adar_edits

        print(c)
        print(len(edits))
        edits.to_csv(file+".filtered_edits.csv")

main()