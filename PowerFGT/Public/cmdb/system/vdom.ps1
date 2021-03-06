﻿#
# Copyright 2019, Alexis La Goutte <alexis dot lagoutte at gmail dot com>
#
# SPDX-License-Identifier: Apache-2.0
#

function Get-FGTSystemVdom {

    <#
        .SYNOPSIS
        Get list of all vdom

        .DESCRIPTION
        Get list of all vdom (name, shortname, cluster-id )

        .EXAMPLE
        Get-FGTSystemVdom

        Get list of all vdom settings

        .EXAMPLE
        Get-FGTSystemVdom -skip

        Get list of all vdom (but only relevant attributes)
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

        $reponse = Invoke-FGTRestMethod -uri 'api/v2/cmdb/system/vdom' -method 'GET' @invokeParams
        $reponse.results
    }

    End {
    }
}