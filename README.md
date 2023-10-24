# Sensor-Coincident-Dates-Finder
This repository contains a MATLAB function for finding coincident or near coincident dates between two sensors, such as MSS5 and MSS4, based on a specified tolerance in days. It's a useful tool for satellite image analysis and data synchronization.

## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Input Parameters](#input-parameters)
- [Output](#output)
- [Getting Started](#getting-started)
- [Examples](#examples)
- [Contributing](#contributing)
- [License](#license)

## Introduction

When working with data from multiple sensors, it's often necessary to find dates that coincide or are near each other within a given time tolerance. This MATLAB function helps you find such dates for MSS5 and MSS4 sensors or any two sensors by comparing their acquisition dates.

## Usage

To use this function, include it in your MATLAB project and call it with the appropriate parameters. The function returns a struct containing the coincident dates for both sensors.

### Input Parameters

- `MSS5_image_drive_location`: The file path to the directory containing MSS5 acquisition dates.
- `MSS4_image_drive_location`: The file path to the directory containing MSS4 acquisition dates.
- `tolerance`: The number of days within which to find coincident dates.

### Output

The function returns a struct named `Coincident` with the following fields:

- `Dates_MSS5`: Array of coincident dates for MSS5.
- `Dates_MSS4`: Array of coincident dates for MSS4 corresponding to MSS5.

## Getting Started

1. Clone this repository or download the `coincidentdates.m` function.
2. Import the function into your MATLAB project.
3. Use the function as described in the usage section.

## Examples

Here's an example of how to use the function:

```matlab
MSS5_directory = 'path_to_MSS5_data';
MSS4_directory = 'path_to_MSS4_data';
tolerance = 7; % A tolerance of 7 days
Coincident = coincidentdates(MSS5_directory, MSS4_directory, tolerance);
disp('Coincident Dates for MSS5:');
disp(Coincident.Dates_MSS5);
disp('Coincident Dates for MSS4:');
disp(Coincident.Dates_MSS4);
