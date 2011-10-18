#! /usr/bin/env sh

# Feed fault.h via stdin and generate a C++ routine on stdout

cat <<EOF

//////////////////////////////////////////////////////////////////////
// DO NOT EDIT
// This code is auto-generated by generate_FaultEnglish.sh
// DO NOT EDIT
//////////////////////////////////////////////////////////////////////

static const char*
faultCodeToEnglish(pluton::faultCode fc)
{
    switch(fc) {
EOF

grep '\/\/ E: ' | while read fName fEqual fCode fSlashSlash fEColon fMessage
do
    printf '        case pluton::%-30s: return "%s:%s\";\n' $fName $fName "$fMessage"
done

cat <<EOF
        default: break;
    }
    return "Unknown faultCode?";
}
EOF