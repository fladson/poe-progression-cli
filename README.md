## poe currency progression

Parse the currency stash tab as JSON and output the current values in a tabular and custom ordered way in order to plot graphs

### How to use
 - Go to https://www.pathofexile.com/
 - Login and open the desired league stash
 - Open the `Developer Tools` view in your browser and open the **network** tab
 - Clear everything
 - Click on the currency stash tab
 - Copy the Response and save as `.json`
 - cd into the lib and run `ruby bin/main.rb ~/path/to/your_file.json | pbcopy`
 - paste into a spreadsheet and plot any graph you want
