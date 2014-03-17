%Optimization as a Tool for Insight
%Matthew Woodruff
%18 November, 2013


# What is Optimization For?

<!--
    What does optimization do?
    Show a picture of a graph.
    But what does f(x) mean?  Why does it have the form that it does?  The constraints that it does?
    I think actually we need a contour plot with constraints drawn on it.
-->

![ ](optimization_1d.svg)

# What is Optimization For?

![ ](smily.svg)


# But What is $f(x)$?

<!--
    And for that matter, where do the constraints come from?
    Optimization necessarily takes the form of the problem as a given, but in fact this is not something we're likely to know in advance.
-->

# But What is $f(x)$?

* The value of optimization is limited by our ability to formulate the problem correctly [@hitch_1960_choice_of_objectives].
* Our problem formulation may be unnecessarily restrictive [@zeleny_1986_optimal].
* Finding $\textrm{argmin}(f(x))$ is mechanical; finding $f(x)$ is the real challenge [@tsoukias_2008_decision_aiding]

<!-- Bring up the vinegar anecdote. -->

# General Aviation Aircraft

![ ](airplane.svg)

Nine design variables
Nine performance criteria

[@simpson96]

<!--
Let's consider an example I've been working on.
The GAA problem is to optimize three aircraft while maintaining as much commonality between them as possible.
-->

# Product Family Design Problem

![ ](3airplanes.svg)

Twenty-seven decision variables across three aircraft

Twenty-seven performance criteria across three aircraft

<!--
So the problem we're looking at is not just optimizing a single aircraft's performance, but three aircraft's performance.
-->

# Conceptual Model

performance criterion      constant                 CSPD                     AR                         SWEEP                     DPROP                   WINGLD   AF             SEATW          ELODT          TAPER          CSPD*AR        CSPD*SWEEP     CSPD*DPROP     CSPD*WINGLD    CSPD*AF        CSPD*SEATW     CSPD*ELODT     CSPD*TAPER     AR*SWEEP       AR*DPROP       AR*WINGLD      AR*AF          AR*SEATW       AR*ELODT       AR*TAPER       SWEEP*DPROP    SWEEP*WINGLD   SWEEP*AF       SWEEP*SEATW    SWEEP*ELODT    SWEEP*TAPER    DPROP*WINGLD   DPROP*AF       DPROP*SEATW    DPROP*ELODT    DPROP*TAPER    WINGLD*AF      WINGLD*SEATW   WINGLD*ELODT   WINGLD*TAPER   AF*SEATW       AF*ELODT       AF*TAPER       SEATW*ELODT    SEATW*TAPER    ELODT*TAPER    pow(CSPD,2)    pow(AR,2)      pow(SWEEP,2)   pow(DPROP,2)   pow(WINGLD,2)  pow(AF,2)      pow(SEATW,2)   pow(ELODT,2)   pow(TAPER,2)
---------------------      --------                 ----                     --                         -----                     -----                   ------   --             -----          -----          -----          -------        ----------     ----------     -----------    -------        ----------     ----------     ----------     --------       --------       ---------      -----          --------       --------       --------       -----------    ------------   --------       -----------    -----------    -----------    ------------   --------       -----------    -----------    -----------    ---------      ------------   ------------   ------------   --------       --------       --------       -----------    -----------    -----------    -----------    ---------      ------------   ------------   -------------  ---------      ------------   ------------   ------------
NOISE2                     74.09                    -0.00                     -0.01                     +0.00                     +0.96                   +0.03    -0.00          -0.00          -0.00          +0.00          0              0              -0.00          -0.00          -0.00          +0             +0.00          0              +0             -0.00          -0.00          -0.00          +0             +0.00          +0.00          0              0              0              0              0              +0             -0.00          +0.00          -0.00          +0.00          -0.00          +0.00          -0.00          -0.00          +0.00          -0.00          0              +0             -0.00          -0.00          +0             +0.00          +0.00          +0.00          +0.11          +0.00          -0.00          +0.00          +0.00          +0.00
WEMP2                      1917                     +5.97                     +35.13                    -0.71                     +11.11                  -32.29   +5.73          +48.11         +0.33          +15.28         +1.24          -0.13          +1.12          -2.39          +0.39          -0.49          -0.38          +0.57          -0.22          -0.07          -3.80          -0.01          -0.09          -0.93          +3.13          -0.03          +0.43          +0.02          +0.40          +0.30          +0.70          -0.20          +1.16          -0.21          -0.19          +0.14          -0.06          +3.19          +2.67          -0.44          -0.05          -0.05          +0.03          +4.88          +1.34          +0.88          +0.95          -1.81          +1.17          +0.75          +3.63          +0.13          +5.32          +1.47          -0.19
DOC2                       83.17                    +12.53                    -0.04                     -0.02                     +3.59                   -0.73    +0.74          +0.73          -0.20          +0.03          +0.65          +0.04          +1.20          +0.68          +0.09          -0.70          +0.27          +0.01          +0.00          +0.21          -0.07          -0.24          -0.01          +0.01          +0.00          +0.01          +0.01          -0.00          -0.00          -0.00          -0.00          +0.07          +0.67          -0.19          +0.05          -0.02          +0.01          +0.08          +0.05          +0.01          -0.06          +0.00          -0.01          +0.09          +0.00          -0.00          -11.37         -0.28          -0.31          +5.33          -0.37          -0.07          -0.21          -0.23          -0.23
ROUGH2                     2.19                     -0.00                     +0.15                     -0.00                     +0.02                   -0.16    -0.00          -0.06          -0.01          +0.00          +0.00          +0.00          0              +0.00          0              +0.00          -0.00          -0.00          -0.00          +0.00          -0.01          -0.00          -0.00          -0.00          -0.00          -0.00          -0.00          0              -0.00          -0.00          -0.00          -0.00          -0.00          +0.00          -0.00          -0.00          -0.00          -0.00          -0.00          -0.00          +0.00          -0.00          -0.00          -0.00          -0.00          0              +0.00          -0.02          -0.00          +0.00          +0.00          +0.00          -0.00          -0.00          -0.00
WFUEL2                     416.39                   -6.09                     -31.91                    +0.79                     -19.17                  +34.18   -7.57          -49.61         +0.23          -15.33         -1.20          +0.17          -1.24          +1.70          -0.45          +0.15          +0.61          -0.52          +0.22          -0.49          +4.05          -0.10          +0.26          +0.85          -3.18          +0.03          -0.48          -0.02          -0.38          -0.32          -0.71          +0.33          -2.40          +0.45          +0.13          -0.12          +0.24          -2.89          -3.01          +0.36          -0.11          +0.05          -0.02          -4.68          -1.33          -0.93          -0.75          +1.13          -1.07          -5.98          -3.04          +0.06          -4.95          -1.41          +0.35
PURCH2                     43280                    +133.1                    +780.40                   -1.50                     +494                    -331.8   +191.2         +786           +102           +333.9         +25.95         -2.44          +28.28         -50.50         +11.55         -6.18          -4.32          +13.78         -3.33          +0.42          -69.11         -0.88          +7.22          -20.38         +69.58         -1.10          +7.07          +0.07          +5.35          +4.93          +14.77         -21.82         +22.17         +14.2          -7.53          +5.81          -6.77          +27.99         +47.08         -9.88          +3.13          -2.65          +1.03          +82.23         +27.96         +16.11         +10.51         -49.18         +26.51         +35.31         +33.56         +10.66         +74.30         +8.46          -0.73
RANGE2                     1971                     -6.80                     -76.23                    +2.88                     -363.79                 -383.10  -68.09         -67.48         +18.09         -165.69        +0.08          +0.27          +1.67          +3.34          +0.15          -0.46          +0.85          +2.53          +0.00          -23.23         -25.79         -1.78          +9.43          -1.91          -40.20         -1.47          -1.31          -0.21          -0.71          -0.58          -0.86          +121.09        -26.70         +25.28         -10.74         +37.08         +21.29         +19.29         -4.31          -20.36         +3.61          -1.67          +7.54          -7.23          +16.86         -3.00          -11.61         +4.89          -11.61         -84.11         +65.38         -7.10          -15.61         -13.11         +8.89
LDMAX2                     17.78                    +0.48                     +1.62                     +0.02                     -0.01                   -0.52    -0.00          -0.49          +0.21          +0.03          +0.05          +0.00          -0.00          -0.01          -0.00          -0.00          +0.01          +0.00          +0.00          -0.00          -0.06          -0.00          -0.05          +0.01          +0.00          -0.00          -0.00          +0             -0.00          -0.00          +0             +0.00          -0.00          +0.00          -0.00          +0.00          -0.00          -0.07          -0.02          -0.00          +0.00          -0.00          +0.00          -0.05          -0.00          -0.00          -0.08          -0.14          -0.01          -0.00          +0.01          -0.00          -0.05          -0.03          -0.00
VCMAX2                     200.4                    -0.37                     +0.82                     +0.21                     +1.74                   +5.58    -0.16          -3.52          +1.55          +0.24          -0.02          +0.00          -0.04          -0.01          -0.00          +0.05          +0.05          +0.02          +0.01          -0.09          +0.14          -0.00          +0.01          -0.07          -0.01          -0.00          -0.03          -0.00          -0.05          -0.02          +0.00          -0.27          -0.34          +0.20          -0.08          -0.00          -0.09          -0.70          -0.12          -0.01          +0.05          -0.03          -0.00          -0.36          -0.04          -0.05          -0.14          -0.29          +0.03          +0.13          -0.65          +0.13          -0.61          -0.37          +0.03
NOISE4                     74.09                    -0.00                     -0.01                     +0.00                     +0.96                   +0.03    -0.00          -0.00          -0.00          +0.00          0              +0             -0.00          -0.00          -0.00          0              +0.00          0              +0             -0.00          -0.00          -0.00          0              +0.00          +0.00          0              0              0              0              0              +0             -0.00          +0.00          -0.00          +0.00          0              +0.00          -0.00          -0.00          +0.00          -0.00          0              +0             -0.00          0              0              +0.00          +0.00          +0.00          +0.11          +0.00          -0.00          +0.00          +0.00          +0.00
WEMP4                      1947                     +6.33                     +33.86                    -0.44                     +11                     -30.85   +5.72          +53.22         +1.89          +15.26         +1.96          -0.15          +1.07          -1.69          +0.46          -0.95          -0.98          +0.59          +0.00          +0.08          -3.44          +0.10          -0.18          +0.78          +1.59          +0.02          +0.34          +0.03          +0.31          +0.22          +0.56          -0.18          +1.06          -0.07          -0.23          +0.13          -0.09          +1.93          +1.85          -0.80          -0.07          -0.13          +0.10          +4.81          +1.30          +1.26          +0.40          +1.06          +0.73          +0.48          +5.81          -0.13          +3.59          +0.62          +1.26
DOC4                       83.15                    +12.02                    -0.07                     -0.01                     +3.42                   -0.70    +0.72          +0.72          -0.14          +0.04          +0.61          +0.04          +1.15          +0.71          +0.09          -0.83          +0.22          +0.00          +0.00          +0.18          -0.06          -0.23          -0.04          +0.01          +0.02          +0.01          +0.00          -0.01          +0.00          -0.01          -0.01          +0.12          +0.65          -0.27          +0.04          -0.03          +0.01          +0.09          +0.03          +0.00          -0.06          -0.02          -0.02          +0.06          +0.00          -0.00          -10.95         -0.24          -0.22          +5.22          -0.26          -0.08          -0.21          -0.30          -0.22
ROUGH4                     2.19                     -0.00                     +0.15                     -0.00                     +0.02                   -0.16    -0.00          -0.06          -0.01          +0.00          -0.00          +0.00          0              +0.00          -0.00          +0.00          +0.00          -0.00          -0.00          +0.00          -0.01          -0.00          -0.00          -0.00          +0.00          -0.00          -0.00          -0.00          -0.00          -0.00          -0.00          -0.00          -0.00          +0.00          -0.00          -0.00          -0.00          -0.00          -0.00          -0.00          +0.00          -0.00          -0.00          -0.00          -0.00          -0.00          -0.00          -0.03          -0.00          +0.00          +0.00          +0.00          +0.00          -0.00          -0.00
WFUEL4                     385.5                    -6.70                     -30.57                    +0.50                     -18.91                  +33.00   -7.54          -55.16         -1.44          -15.32         -1.93          +0.18          -1.20          +1.43          -0.55          +0.27          +1.17          -0.55          -0.01          -0.64          +3.71          -0.19          +0.35          -0.82          -1.63          -0.04          -0.37          -0.02          -0.32          -0.26          -0.55          +0.58          -2.33          +0.01          +0.20          -0.12          +0.34          -1.50          -2.13          +0.74          -0.08          +0.18          -0.10          -4.86          -1.35          -1.28          +0.14          -1.69          -0.60          -6.02          -4.97          +0.26          -3.22          -0.49          -1.06
PURCH4                     43730                    +142.5                    +756.5                    +2.00                     +504.79                 -314.79  +194.10        +890.5         +114.09        +334.5         +43.02         -2.86          +27.42         -35.06         +13.28         -17.02         -18.83         +14.26         +0.82          +3.72          -60.38         +3.03          +7.39          +18.80         +35.36         -0.07          +6.45          +0.50          +4.74          +3.97          +11.97         -20.6          +20.54         +18.09         -7.55          +5.42          -8.09          +2.43          +29.82         -17.86         +3.67          -3.44          +2.99          +86.11         +29.12         +26.49         -1.45          +16.04         -0.70          +45.99         +87.14         +0.89          +51.65         -2.25          +25.59
RANGE4                     1941                     -6.76                     -68.91                    +2.31                     -346.79                 -365     -65.25         -77.59         +13.19         -155.30        +0.11          +0.22          +1.22          +3.72          +0.01          -0.05          +0.67          +2.67          +0.07          -24.07         -31.30         -1.97          +11.8          -0.62          -38.31         -1.15          -0.97          -0.20          -0.58          -0.45          -0.77          +115.40        -26.84         +27.91         -7.89          +34.34         +20.61         +28.92         -3.00          -27.87         +4.10          -1.17          +7.18          -7.38          +18.02         -2.45          -12.83         +4.66          -12.33         -85.33         +57.16         -8.83          -16.33         -13.33         +8.16
LDMAX4                     17.43                    +0.48                     +1.58                     +0.02                     -0.01                   -0.54    -0.00          -0.49          +0.16          +0.02          +0.06          +0.00          -0.00          -0.01          -0.00          -0.00          +0.00          +0.00          +0.00          -0.00          -0.06          -0.00          -0.05          +0.01          -0.00          +0.00          -0.00          +0.00          -0.00          -0.00          -0.00          -0.00          -0.00          +0.00          -0.00          +0.00          -0.00          -0.06          -0.02          -0.00          +0             -0.00          +0.00          -0.04          -0.00          -0.00          -0.09          -0.13          -0.01          -0.00          +0.03          -0.00          -0.05          -0.02          +0.00
VCMAX4                     197.80                   -0.35                     +0.77                     +0.18                     +1.88                   +5.33    -0.12          -3.58          +1.18          +0.23          +0.01          +0.00          -0.04          +0.00          -0.00          +0.03          +0.02          +0.01          +0.00          -0.09          +0.17          -0.01          +0.02          -0.00          -0.05          -0.01          -0.01          -0.00          -0.03          -0.01          +0.00          -0.25          -0.33          +0.20          -0.06          -0.01          -0.10          -0.68          -0.12          -0.02          +0.06          -0.01          +0.00          -0.27          -0.03          -0.01          -0.14          -0.19          -0.25          +0.39          -0.51          +0.07          -0.41          -0.25          -0.03
NOISE6                     74.09                    -0.00                     -0.01                     +0.00                     +0.96                   +0.03    -0.00          -0.00          -0.00          +0.00          +0             +0             -0.00          -0.00          -0.00          0              0              0              +0             -0.00          -0.00          -0.00          -0.00          +0.00          +0.00          0              0              0              0              0              +0             -0.00          +0.00          -0.00          +0.00          -0.00          +0.00          -0.00          -0.00          +0.00          -0.00          +0             +0             -0.00          0              0              +0.00          +0.00          +0.00          +0.11          +0.00          -0.00          +0.00          +0.00          +0.00
WEMP6                      1972                     +5.38                     +33.29                    -0.02                     +10.82                  -28.88   +5.58          +61.32         +4.65          +16.62         +1.32          -0.25          +0.90          -1.40          +0.36          -0.01          +0.01          +0.47          +0.04          -0.05          -3.81          -0.04          +0.50          +0.28          +2.49          +0.00          +0.15          +0.05          +0.11          +0.04          +0.39          +0.18          +1.25          +0.04          +0.10          +0.05          +0.09          +1.80          +1.11          -1.43          +0.06          +0.05          +0.05          +2.91          +0.09          -0.14          +1.44          -2.52          +1.64          +1.38          +2.65          +0.75          +3.11          +1.21          -0.44
DOC6                       83.26                    +11.86                    -0.08                     -0.02                     +3.34                   -0.64    +0.70          +0.82          -0.09          +0.03          +0.6           +0.02          +1.10          +0.69          +0.07          -0.99          +0.11          -0.01          +0.00          +0.17          -0.06          -0.24          -0.05          -0.00          -0.00          +0.00          +0.00          -0.00          +0.00          -0.00          +0.00          +0.13          +0.64          -0.35          -0.00          -0.05          +0.00          +0.11          +0.03          +0.01          -0.06          +0.00          -0.01          +0.03          -0.00          +0.00          -10.77         -0.28          -0.28          +5.18          -0.23          -0.08          -0.21          -0.25          -0.26
ROUGH6                     2.16                     +0.00                     +0.15                     -0.00                     +0.02                   -0.16    -0.00          -0.06          -0.01          +0.00          +0.00          +0.00          +0.00          0              0              +0             -0.00          -0.00          -0.00          +0.00          -0.01          +0             -0.00          -0.00          -0.00          -0.00          -0.00          -0.00          -0.00          -0.00          +0.00          -0.00          -0.00          +0.00          -0.00          -0.00          -0.00          -0.00          -0.00          -0.00          +0.00          -0.00          -0.00          -0.00          -0.00          +0.00          -0.00          -0.02          -0.00          +0.00          +0.00          +0.00          +0.00          -0.00          -0.00
WFUEL6                     359.70                   -5.78                     -29.99                    +0.06                     -18.70                  +31      -7.33          -63.59         -4.44          -16.70         -1.31          +0.27          -1.06          +1.18          -0.39          -0.80          +0.05          -0.44          -0.04          -0.51          +4.11          -0.04          -0.32          -0.30          -2.52          -0.00          -0.17          -0.05          -0.13          -0.06          -0.39          +0.27          -2.45          -0.13          -0.15          -0.04          +0.07          -1.29          -1.25          +1.38          -0.19          -0.00          -0.03          -2.96          -0.12          +0.14          -0.89          +1.72          -1.61          -6.30          -1.94          -0.65          -2.72          -1.18          +0.52
PURCH6                     44220                    +124.40                   +749.20                   +9.32                     +506.89                 -290.60  +192.80        +1034          +144.5         +364.79        +27.37         -5.91          +24.51         -29.69         +10.97         +2.65          +2.26          +11.44         +2.04          +0.27          -67.76         -0.33          +25.07         +7.37          +56.36         -0.18          +1.59          +1.08          +1.37          +0.43          +8.3           -11.7          +24.44         +23.85         +1.19          +3.79          -3.02          +4.45          +18.05         -30.70         +7.10          +1.01          +1.46          +53.56         +4.06          -3.48          +15.24         -71.91         +33.99         +60.54         +15.24         +28.49         +50.49         +18.19         -9.01
RANGE6                     1932                     -6.38                     -64.40                    +1.77                     -342.79                 -356.39  -64.63         -91.73         +5.65          -150.5         -0.23          +0.05          +1.34          +3.52          +0.02          -0.29          +0.02          +2.41          +0.04          -24.78         -35.15         -2.13          +13.65         -0.00          -35.59         -0.95          -0.61          -0.16          -0.34          -0.11          -0.57          +114.30        -26.83         +33.29         -4.76          +33.18         +20.6          +38.63         +0.42          -31.94         +5.05          -0.88          +6.87          -3.92          +20.36         +0.09          -11.73         +4.26          -10.73         -83.73         +39.27         -7.23          -14.23         -11.73         +9.26
LDMAX6                     17.34                    +0.48                     +1.57                     +0.01                     -0.01                   -0.58    -0.00          -0.56          +0.09          +0.02          +0.06          +0.00          -0.00          -0.01          -0.00          -0.00          +0.00          +0.00          +0.00          -0.00          -0.06          -0.00          -0.05          +0.00          +0.00          +0.00          -0.00          +0             -0.00          -0.00          -0.00          +0.00          -0.00          +0.00          +0.00          +0.00          -0.00          -0.05          -0.01          -0.00          +0.00          +0.00          +0.00          -0.02          -0.00          -0.00          -0.08          -0.14          -0.00          +0.00          +0.02          +0.00          -0.03          -0.01          +0.00
VCMAX6                     197.10                   -0.33                     +0.75                     +0.15                     +1.91                   +5.04    -0.11          -4.07          +0.72          +0.22          -0.02          -0.00          -0.03          -0.00          -0.00          +0.03          +0.02          +0.01          +0.01          -0.09          +0.17          -0.01          +0.05          -0.02          -0.02          -0.00          -0.02          -0.00          -0.02          -0.01          -0.00          -0.23          -0.33          +0.23          -0.04          -0.01          -0.08          -0.61          -0.08          -0.01          +0.06          -0.00          -0.00          -0.16          -0.04          -0.02          -0.23          -0.38          -0.01          +0.31          -0.61          +0.20          -0.28          -0.12          -0.01

# $z = f(\bar{x})$

![ ](goalprogram.png)


One objective function from twenty-seven performance criteria


# Constrained Optimization 
![ ](constrained_optimization.svg)

Minimize Z

<!-- This optimization problem is also subject to certain constraints. -->

# But Actually...

![ ](chaos.png) ![ ](chaos_feasible.png)

Black = feasible

# This Problem Has an Optimal Solution

$z=0.58$

$\bar{x} = (0.24, 7.01, 3.59, 5.58, 21.13, 85.01, 18.29, 3.75, 0.46, 0.24, 7.02, 3.58, 5.58, 21.12, 85.00, 18.28, 3.75, 0.46, 0.24, 7.02, 3.58, 5.58, 21.12, 85.00, 18.28, 3.75, 0.46)$
<!--
Is that meaningful?
Does 0.58 make us happy?
What about commonality?
Oh, yeah, commonality.-->

# Tradeoff

![ ](2dtradeoff.svg)

<!-- 
We get a tradeoff between performance and commonality.
Our original solution is marked in yellow.
In principle you can do this with gradient-descent or something. 
We could treat it as a constraint.
I used an MOEA.

Maybe we want the yellow solution and maybe we don't.  
Now we know where it is on the tradeoff, but we still don't know what it *means*.
-->

# Ten-Objective Problem Formulation

![ ](10obj.png)

Minimize the maximum value of the nine performance criteria across the three aircraft.

<!--
The two-objective problem formulation looks pretty limited now.
We can see the deficiencies of our goals.
We can see that they emphasize mainly range and doc, while leaving a lot of eg vcmax on the table
I was able to do this by using an MOEA
-->

# Ten-Objective Problem Formulation

![ ](10obj.png)

How would we use this?  Are we done reformulating the problem?

<!--
Interactive brushing on each axis.  Or MCDM on the options.  
Or go back to the 2d formulation.  Or a new aggregation scheme.
-->

# 
## This Study
* [@woodruff_2013_mova]

## Future Work

* More problem formulations
    - Integer variables
    - Other aggregation schemes
* More problems

## Complementary Work

* Selecting solutions
    - visually
    - MCDM

# Bibliography
<!--
Things are a little more complicated than our example.
This is a quadratic goal program.  
Projected down to two variables, the 
-->


<!--
"Optimization as a Tool for Insight"

What is optimization for?
This talk goes beyond the obvious answer that it is for finding the best solution, to discuss optimization's role for developing insight about the nature of a problem.
It includes an example from engineering design that illustrates how feedback from optimization can enable designers to reconceive the problem itself.
This example will explore the same problem using both goal programming and multi-objective evolutionary algorithms, and discuss how both techniques may be used to develop insight.
-->

<!--
who: OR grad students

what: developing insight through optimization

when: next monday

where: 311 Leonard 
       hamming, franssen, brill, tsoukias

how: briefly note the two sides of the atlantic
     example: GAA problem

why: because optimization exists in a decision-making context
-->

