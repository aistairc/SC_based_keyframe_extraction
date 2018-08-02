
# Download SMRS
$SMRS = "SMRS_v1.0"
if (-Not (Test-Path "./${SMRS}.zip")) {
    Write-Host "> Download ${SMRS}."
    Invoke-WebRequest -Uri "http://www.ccs.neu.edu/home/eelhami/codes/${SMRS}.zip" -Outfile ./${SMRS}.zip
}
if (Test-Path "./${SMRS}.zip") {
    Write-Host "> Extract ${SMRS} files."
    Expand-Archive -Path ./${SMRS}.zip -DestinationPath ./ -Force
    $copyItems = @{
        Path = "./${SMRS}/*.m"
        Destination = "./"
        Force = $true
    }
    Copy-Item @copyItems
    Remove-Item -Path "./${SMRS}" -Recurse -Force
    Remove-Item -Path "./__MACOSX" -Recurse -Force
}


# Download S08 Brownie Video
$S08VIDEO = "S08_Brownie_Video"
$S08SAMPLE_VIDEO = "S08_Brownie_7150991-935.avi"
if (-Not (Test-Path "./${S08VIDEO}.zip")) {
    Write-Host "> Download ${S08VIDEO}."
    Invoke-WebRequest -Uri "http://kitchen.cs.cmu.edu/Main/${S08VIDEO}.zip" -Outfile ./${S08VIDEO}.zip
}
if (Test-Path "./${S08VIDEO}.zip") {
    Write-Host "> Extract ${S08VIDEO} files."
    Expand-Archive -Path ./${S08VIDEO}.zip -DestinationPath ./${S08VIDEO} -Force
    Copy-Item -Path ./${S08VIDEO}/${S08SAMPLE_VIDEO} -Destination ./ -Force
}


# Download S08 Brownie Five Wired IMU's
$S083DMGX1 = "S08_Brownie_3DMGX1"
if (-Not (Test-Path "./${S083DMGX1}.zip")) {
    Write-Host "> Download ${S083DMGX1}."
    Invoke-WebRequest -Uri "http://kitchen.cs.cmu.edu/Main/${S083DMGX1}.zip" -Outfile ./${S083DMGX1}.zip
}
if (Test-Path "./${S083DMGX1}.zip") {
    Write-Host "> Expand ${S083DMGX1} archive."
    Expand-Archive -Path ./${S083DMGX1}.zip -DestinationPath ./${S083DMGX1} -Force
}

