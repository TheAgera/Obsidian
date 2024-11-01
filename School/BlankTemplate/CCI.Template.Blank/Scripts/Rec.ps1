# Install the PSSVG module
Install-Module -Name PSSVG

# Import the PSSVG module
Import-Module -Name PSSVG


param(
    [string]$First,
    [string]$Last
)
# Define the SVG content
$svgContent = @"
<svg xmlns="http://www.w3.org/2000/svg" width="12in" height="8in">
  <g
     id="g1700"
     transform="rotate(-90,385.12171,384.18695)">
    <rect x="0" y="0" width="8in" height="4in" stroke="black" stroke-width="1" fill="blue" />
    <rect x="0" y="4in" width="8in" height="4in" stroke="black" stroke-width="1" fill="yellow" />
    <rect x="0in" y="8in" width="8in" height="4in" stroke="black" stroke-width="1" fill="red" />

    <!-- Text Blocks -->
    <text font-family="Noto Sans JP Regular" font-size="98pt" fill="black" text-anchor="left" letter-spacing="4px">
        <tspan x="4in" y="1.75in">$First</tspan>
        <tspan x="4in" dy="1.5in">$Last</tspan>
    </text>
    <text font-family="Noto Sans JP Regular" font-spacing="4px" font-size="98pt" fill="black" text-anchor="left" letter-spacing="4px">
        <tspan x="4in" y="5.75in">$First</tspan>
        <tspan x="4in" dy="1.5in">$Last</tspan>
    </text>
    <text font-family="Noto Sans JP Regular" font-size="98pt" fill="black" text-anchor="left" letter-spacing="4px">
        <tspan x="4in" y="9.75in">$First</tspan>
        <tspan x="4in" dy="1.5in">$Last</tspan>
    </text>
    </g>
</svg>
"@

$svgContent | Out-File -FilePath ".\rectangle.svg"

# Define file paths
# $inkscapePath = 'C:\Program Files\Inkscape\bin\inkscape.com'
# $inputFilePath = ".\rectangle.svg"
# $outputFilePath = ".\rectangle_Path.svg"

# # Start the process
# Start-Process -FilePath $inkscapePath -ArgumentList $inputFilePath, "-T", "-l","--export-filename=$outputFilePath"