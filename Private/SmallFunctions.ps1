function positive ([int]$N) {
    # adds plus to positive numbers
    if ($N -gt 0) {
        "+$N"
    } else {
        [string]$N
    }
}