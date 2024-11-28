import sys
import pandas as pd

files = sys.argv[1:]

def get_nonzero(x):
    #nonzero = x[x["Frequency"] > 0.99]
    nonzero = x[x["BaseCount[A,C,G,T]"]]
    return nonzero

def get_adar_edits(x):
    #adarE = x[ (x["AllSubs"] == 'AG') | (x["AllSubs"] == 'TC') ]
    adarE = x[ x["AllSubs"].str.contains('AG') | x["AllSubs"].str.contains('TC') ]
    #adarE = x[ (x["Reference"] == 'A') | (x["Reference"] == 'T') ]
    return adarE

def main():
    for file in files:

        print(file)
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
        #print(len(df_2s))
        print(len(edits))
        edits.to_csv(file+".filtered_edits.csv")

def quick_an():
    for file in files:

        print(file)
        df = pd.read_csv(file, sep="\t", chunksize=5000)
        edits = pd.DataFrame()
        c = 1
        for chunk in df:
            adar_edits = get_nonzero(chunk)
            edits = pd.concat([edits, adar_edits])
    print(len(edits))

main()
#quick_an()