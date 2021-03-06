﻿#
# Copyright 2019, Alexis La Goutte <alexis dot lagoutte at gmail dot com>
# Copyright 2019, Benjamin Perrier <ben dot perrier at outlook dot com>
#
# SPDX-License-Identifier: Apache-2.0
#

function Get-FGTRouterStatic {

    <#
        .SYNOPSIS
        Get list of all "static routes"

        .DESCRIPTION
        Get list of all "static routes" (destination network, gateway, port, distance, weight...)

        .EXAMPLE
        Get-FGTRouterStatic

        Get list of all static route object

        .EXAMPLE
        Get-FGTRouterStatic -skip

        Get list of all static route object (but only relevant attributes)
    #>

    Param(
        [Parameter(Mandatory = $false)]
        [switch]$skip
    )

    Begin {
    }

    Process {

        $invokeParams = @{ }
        if ( $PsBoundParameters.ContainsKey('skip') ) {
            $invokeParams.add( 'skip', $skip )
        }

        $response = Invoke-FGTRestMethod -uri 'api/v2/cmdb/router/static' -method 'GET' @invokeParams
        $response.results
    }

    End {
    }
}
