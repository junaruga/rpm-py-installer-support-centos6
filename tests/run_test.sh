#!/bin/sh

set -xe

CUR_DIR=$(dirname "${0}")

PYTHON=/build/Python-2.6.6/dest/bin/python
WORK_DIR=/build/work
if [ -d "${WORK_DIR}" ]; then
    rm -rf "${WORK_DIR}"
fi
mkdir "${WORK_DIR}"

pushd "${WORK_DIR}"
yumdownloader rpm-python
rpm2cpio rpm-python-*.x86_64.rpm | cpio -idmv
cp -rp ./usr/lib64/python2.6/site-packages/rpm \
    /build/Python-2.6.6/dest/lib/python2.6/site-packages/rpm
popd

# Test for rpm.ts
RESULT1=$("${PYTHON}" -c "
import rpm
print(rpm.ts)
")
test "${RESULT1}" = "<class 'rpm.transaction.TransactionSet'>" \
    && echo "Test 1: [OK]"

# Test for rpm.expandMacro
RESULT2=$("${PYTHON}" -c "
import rpm
rpm.spec('${CUR_DIR}/hello.spec')
print(rpm.expandMacro('%name'))
")
test "${RESULT2}"='hello' && echo "Test 2: [OK]"
