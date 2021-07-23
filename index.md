---
title: "Conductor Documentation"
sidebar: home_sidebar
permalink: index.html
summary: 
  "Documentation for the [Symphony Das](http://symphony-das.github.io) wrapper, Conductor, written in MATLAB (2018b) for windows."
---

{% include note.html content="In order to use this extension package,
Symphony-Core libraries must be installed and Symphony must be packaged from <a
href='https://github.com/Khlick/symphony-matlab'>this repository</a>." %}

## Key Features

* Manage multiple users and configurations.
* Store presets for users and configurations
* Protocol wrapper classes for standardizing new protocols
  * Includes extensive working protocols designed for slice patch and ERG rigs
  * LED protocols will populate LED device parameters based on rig
    configuration, no longer needing to identify LED device names in protocol
    classes.
* Extended device classes and device management methods
  * Specific device classes for amplifiers, LEDs, filter wheels
  * Bind motorized filter wheels to LED device configurations
* Modules
  * Note taking.
  * Enhanced background, configuration and filter wheel control in a single module.
* Reusable default figures
  * Dual stim preview: for previewing 2 stimuli on the preview panel
  * Persist epochs in mean response figures
  * Show a histogram or fourier transform of a recorded epoch.
  * Custom color figures
* Additional utilities 


## How To Use

### Installation

1) To use the latest stable version, download the release executable and follow
instructions of the installer. *Tip*: Choose an install directory located
somewhere on the main system drive, e.g. `.../User/Documents/Conductor`.

2) To use the latest development version, clone this repo into your chosen
   working directory:
   ```powershell
   cd Path/To/Your/Package/
   git clone https://github.com/sampath-lab-ucla/Conductor.git
   ```

### Setup
Run MATLAB where Symphony-DAS will be used. Navigate the Current Folder to the
install directory of Conductor. At the MATLAB command window, run
`SetupSymphony` and follow the prompts to configure Symphony for Conductor.

Create a user with a template setup type in the displayed prompt and edit the 
rig configuration files to match your specific rig. Users and user setups will
be added to the install directory.

For example, creating a user, `Khris`, with a single setup, `Calibration`, will
result in the following document structure:
```powershell
[.\Conductor]> ls
    Directory: .\Conductor


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----          1/1/2020   1:01 PM                main
d-----          1/1/2020   1:01 PM                khris
------          1/1/2020   1:01 PM           3146 SetupSymphony.m
------          1/1/2020   1:01 PM           1548 SymphonyShutdown.m
------          1/1/2020   1:01 PM           3138 SymphonyStartup.m


[.\Conductor]> ls .\khris


    Directory: .\Conductor\khris


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----          1/1/2020   1:01 PM                Calibration


[.\Conductor]> ls .\khris\Calibration\ -r


    Directory: .\Conductor\khris\Calibration


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----          1/1/2020   1:01 PM                +kg


    Directory: .\Conductor\khris\Calibration\+kg


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----          1/1/2020   1:01 PM                +epochgroups
d-----          1/1/2020   1:01 PM                +experiments
d-----          1/1/2020   1:01 PM                +protocols
d-----          1/1/2020   1:01 PM                +rigs
d-----          1/1/2020   1:01 PM                +sources

```

In general, a user file structure follows this scheme:
```
./<Conductor root>
├── User_A
│   ├── Setup_1
│   │   └── +id
│   │       ├── +epochgroups
│   │       ├── +experiments
│   │       ├── +protocols
│   │       ├── +rigs
│   │       └── +sources
│   └── <Setup_2>
│       └── ...
├── <User_B>
│   └── ...
└── [Conductor files]
```

## Update A User / Rig

When a new release is available, download the executable and run it to
automatically update all Conductor files in the existing installation. If asked
to choose an install directory, choose the parent directory of the current
Conductor root. Once installed, you may wish to synchronize user setups with
the most up-to-date versions. To do this, open MATLAB and navigate the current
folder to the Conductor root. Run the `conductor.updateUser()` command and use
the interface to update setups.

![updateUI](./main/lib/img/updateUserUI.jpg)

Select the update type from the dropdown for each rig and click update.

![updateUI success](./main/lib/img/updateUserUI_success.jpg)



## Contact

Report bugs and requests through github issues. All other questions can be addressed to khrisgriffis[at]ucla.edu.


## Test

<a href="#" data-toggle="tooltip"
data-original-title="{{site.data.glossary.hockey}}">Hockey</a> is awesome.


## Thanks To Creators:

[Mark Cafaro](https://github.com/cafarm) for [Symphony](https://symphony-das.github.io/) and patient attentiveness
on the groups forum.

[Jan Simon](https://www.mathworks.com/matlabcentral/profile/authors/869888) for the [FilterM](https://www.mathworks.com/matlabcentral/fileexchange/32261-filterm) tool.

{% include links.html %}