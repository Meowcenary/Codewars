f=->w,h{
  s=' '                                #set s to space for golfing reasons
  a=(s*9+?_*5)*(w/2)+$/                #start building the output with a row of just _ and space

  (2-h*2).upto(h*2+3){|y|              #iterate 4 times for each row of hexagons, plus an extra 2 at the end to finish last row
    c=y<4-h*2                          #condition for first two rows
    a+=[b=c ?s:?\\,s+b,s,''][y%4]      #string to be output before main set of hexagons (spaces for top row, \ for certain other rows

    (0-w/2).upto(w/2){|x|              #iterate through hexagons on each row, 4 lines for each with the following printf type string
      a+=["/#{h<y/2?s*7:"%3d,%-3d"}\\",#line 1:contains ends / \ and numbers
         s*7,                          #line 2 padding spaces
         ?_*5,                         #line 3 padding ___
         "/     \\"][(y+x*2+w)%4]%     #line 0 top of hexagon / \; formula to select string to be printed
           [x,y/4]                     #numbers to be printed (if format for current line does not require them they are ignored)
    }

    a+='//  '[c ?3:y%4]+$/             #ending alternates between / and space; / are suppressed for first two rows
  }
  a
}

puts f[25,25]
