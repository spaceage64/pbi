/*
This function will allow you to load country flags (or really any small image) into a Power BI table, allowing
you to display flags in charts and other visuals.

1.  Download the flags.zip file containing the 260 flag images.
2.  Download the countries.csv file and load as a table in your Power BI report (You may name it "countries").
3.  Right click the table and choose Create Function... (You can name the function "Convert to Base64").
4.  Use the following code to create the function. It will take binary content and convert it to Base64, which Power
    BI can then display as an image in your report.
*/

let
    Convert = (BinaryContent as binary) as text=> let
        Base64 = "data:image/png;base64, " & Binary.ToText(BinaryContent, BinaryEncoding.Base64)
    in
        Base64
in
    Convert

/*
5.  Create a new table from a folder (Home > New Source > More... > Folder) and point it to your flags folder. (You
    may also name the table "flags").
6.  When the folder has been selected, choose "Transform Data," not "Combine & Transform Data," which won't work.
7.  Select the "Name" column (containing, e.g., GB.png), click Transform > Replace Values and replace ".png" with
    a blank value (just don't enter anything here) to remove the file extension from the cells.
8.  With the same column selected, choose Add Column > Invoke Custom Function, choose your newly created function,
    provide a name for the new column (e.g., "country_flag"). For the binary data, choose the "Content" column.
9.  You may delete any columns other than the new one (containing the Base64 data) and the one containing the 2-
    letter country code.
10. Close the editor and apply your changes. In the table view, open the flag table and select the column with the
    Base64 data.
11. Go to Column tools > Data category > Image URL.

Done. You can now create, e.g., a new table listing the country names along with their flags. You can, optionally,
link your flag data to the "countries" table by using the 2-letter country codes. Then, you can conveniently link
your own data to the countries table.
*/

/*
Notes:
- Always make sure to set the data category to "Image URL" in the table view, or your images will not be displayed!
- If you'd like to only load the flag images once, in the data transform tool, right click the flags table
- The flags used are 160x160 px, great for scaling to 16 px in tables. To do so, open the formatting pane > Visual
  > Image size, and set it to 16 px.
- The flags used come from the AppleColorEmoji.ttf font, created by Apple and used on iOS and macOS. You may replace
  them, but keep the size in check (~30 kB) or they will not fully render.
- The countries and their corresponding flags are identified using their 2-letter iso country code (i.e., ISO 3166-1
  alpha-2). Should be easy to hook these up to the data you're working with. In the table, I have also provided the
  3-letter code and some basic regional divisions.
- For convenience, I added some non-standard codes (and their flags) for the following countries/regions. Use them
  if you like:
    UN  UNO  United Nations
    EU  EUE  European Union
    UK  GBR  United Kingdom (identical to the official GB)
    XE  ENG  England
    XI  NIR  Northern Ireland
    XS  SCT  Scotland
    XW  WLS  Wales
    XK  XKK  Kosovo
    XX  XXX  Undefined (red flag)
    ZZ  ZZZ  Undefined (red flag)
*/
