import pandas as pd

for k in range(6):
    Data = pd.DataFrame(columns=['x1', 'y1'])

    i = 0
    xlist = []
    ylist = []
    with open('Row2-{}.tup'.format(k+1),'r') as f1:
        with open('Col2-{}.tup'.format(k+1),'r') as f2:
            for x,y in zip(f1.readlines(),f2.readlines()):
                if i==0:
                    i+=1
                    continue
                x1 = x.split()[1]
                xlist.append(x1)
                y1 = y.split()[1]
                ylist.append(y1)
    Data['x1'.format(k+1)] = xlist
    Data['y1'.format(k+1)] = ylist
    Data.to_csv('Pic1_2_contours_{}_XY.csv'.format(k+1),index=False)
print()

