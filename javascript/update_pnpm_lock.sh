#!/bin/bash
for d in *; do pushd ${d}; pnpm update; popd; done
