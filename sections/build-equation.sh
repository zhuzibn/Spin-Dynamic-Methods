#!/usr/bin/env bash

set -euo pipefail

if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <equation-name> [output.svg]" >&2
    exit 1
fi

source_name="$1"
source_file="${source_name}.tex"
output_name="${2:-${source_name}.svg}"
macros_file="../macros.tex"
build_dir=".equation-build"

if [[ ! -f "${source_file}" ]]; then
    echo "Error: ${source_file} does not exist." >&2
    exit 1
fi

if [[ ! -f "${macros_file}" ]]; then
    echo "Error: ${macros_file} does not exist." >&2
    exit 1
fi

mkdir -p "${build_dir}"

source_path="$(realpath "${source_file}")"
macros_path="$(realpath "${macros_file}")"
wrapper_file="${build_dir}/${source_name}_wrapper.tex"
dvi_file="${build_dir}/${source_name}_wrapper.dvi"

cat > "${wrapper_file}" <<EOF
\\documentclass[border=2pt]{standalone}

\\usepackage{amsmath}
\\usepackage{amssymb}
\\usepackage{bm}

\\input{${macros_path}}

\\begin{document}
\\(\\displaystyle
\\input{${source_path}}
\\)
\\end{document}
EOF

latex \
    -interaction=nonstopmode \
    -halt-on-error \
    -output-directory="${build_dir}" \
    "${wrapper_file}"

dvisvgm \
    --no-fonts \
    --exact \
    --output="${output_name}" \
    "${dvi_file}"

echo "Generated: $(realpath "${output_name}")"
