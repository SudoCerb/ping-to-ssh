# a function that will ping a given address until it responds, and then 
# initiate an ssh connection to that address with the specified username
# usage: pssh <address> <username>
# example: pssh 192.168.101.117 pi

function pssh {
    param(
        [Parameter(Mandatory=$true)]
        [string]$address,
        [Parameter(Mandatory=$true)]
        [string]$username
    )
    $ping = $false
    while ($ping -eq $false) {
        $ping = Test-Connection -ComputerName $address -Count 1 -Quiet
    }
    ssh $username@$address
}
