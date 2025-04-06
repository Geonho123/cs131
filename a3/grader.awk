# Set input and output field separators
BEGIN {
    FS = ","     # Input is comma-separated
    OFS = "\t"   # Output will be tab-separated
    print "Name", "Total", "Average", "Status"
}

# Skip the header line
NR == 1 {
    next
}

# Process each student
{
    studentName = $2
    cs146 = $3
    cs131 = $4
    cs100w = $5

    # Calculate total score and average
    sumScores[studentName] = cs146 + cs131 + cs100w
    avg[studentName] = getAvg(cs146, cs131, cs100w)

    # Determine pass/fail status based on average
    if (avg[studentName] >= 70)
        result[studentName] = "Pass"
    else
        result[studentName] = "Fail"

    # Update top scorer
    if (highestScore == "" || sumScores[studentName] > highestScore) {
        highestScore = sumScores[studentName]
        topScorer = studentName
    }

    # Update lowest scorer
    if (lowestScore == "" || sumScores[studentName] < lowestScore) {
        lowestScore = sumScores[studentName]
        lowScorer = studentName
    }

    # Store the order of students for printing later
    nameOrder[NR] = studentName
}

# Print the results for each student and top/bottom scorers
END {
    for (i in nameOrder) {
        n = nameOrder[i]
        print n, sumScores[n], avg[n], result[n]
    }
# Used printf to make "Top score student:" and topScorer closer without additional space
    printf "\nTop score student: %s\n", topScorer
    printf "Lowest score student: %s\n", lowScorer
}

# User-defined function to compute average of three scores
function getAvg(a, b, c) {
    return (a + b + c) / 3
}
