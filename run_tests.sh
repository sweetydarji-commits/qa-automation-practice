echo "===== TEST EXECUTION STARTED ====="

PASS_COUNT=0
FAIL_COUNT=0

while IFS=, read -r TC_ID MODULE TEST_NAME STATUS
do
  echo "---------------------------------"
  echo "Running $TC_ID | $MODULE | $TEST_NAME"

  if [ "$STATUS" != "pass" ]; then
    echo "$TC_ID FAILED ❌"
    FAIL_COUNT=$((FAIL_COUNT+1))
    exit 1
  else
    echo "$TC_ID PASSED ✅"
    PASS_COUNT=$((PASS_COUNT+1))
  fi

done < testcases.csv

echo "---------------------------------"
echo "Total Passed: $PASS_COUNT"
echo "Total Failed: $FAIL_COUNT"
echo "===== ALL TESTS PASSED ====="

