# ARPESCode

This is code I wrote under the supervision of Dr. L. Andrew Wray at New York University, Center for Quantum Phenomena 
<h4> Description </h4></br>
This is a visualliser for APRES data. It can display the orignal data with respect to energy (in eV) and the two directions of momentum, derived from the lateral angle and polar angle from the ARPES measurements. You can choose to view the graphs of their minumum gradient or the orignal data. </br></br>
<h4> Directions </h4></br>
<ol>
  <li>Open the Display folder in Processing.</li>
  <li>Click the green arrow inside the white circle button at the top left to start the program.</li>
  <li>You have to wait for all of the files to load before the graph appears. The progress of the files being loaded appears in the terminal at the bottom of the program. (Usually takes 20 seconds). </li>
  <li>Press the right and left arrow keys to change the slice of the data you are looking at.</li>
    <dl>
      <dt>If the mode is 0 or 1, the right and left arrow keys change the value of polar angle, aka one direction in the momentum space.</dt>
      <dt>If the mode is 2 or 3, the right and left arrow keys change the value of the energy.</dt>
    </dl>
  <li>Press the space bar to switch between the orignal data and its minumum gradient graph.</li>
  <li>If you want to switch the type of data you are looking at or the data set, make the following change and rerun the code: </li>
    <dl>
      <dt>If you want to view the data with respect to energy and one momentum direction, change the mode to 1 (in line 12).</dt>
      <dt>If you want to view the data with respect to two momentum directions, change the mode to 3 (in line 12).</dt>
      <dt>If you want to view dataset 18, change fileNum to 18 (line 15) and fileAmount to 33 (line 16).</dt>
      <dt>If you want to view dataset 33, change fileNum to 33 (line 15) and fileAmount to 30 (line 16). This is the default data set.</dt>
    </dl>
</ol>
