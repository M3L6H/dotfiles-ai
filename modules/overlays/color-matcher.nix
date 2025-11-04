self: super: {
  pythonPackagesExtensions = super.pythonPackagesExtensions ++ [
    (pythonSelf: pythonSuper: {
      color-matcher =
        let
          pname = "color-matcher";
          version = "0.6.0";
        in
        pythonSuper.buildPythonPackage {
          inherit pname version;
          pyproject = true;

          src = pythonSuper.fetchPypi {
            inherit pname version;
            hash = "sha256-e6igB4LD5eWTHdp7H7nFcqzoLeDGyXZUQyt8/gqnSEM=";
          };

          build-system = [ pythonSuper.setuptools ];

          dependencies = with super.pkgs.python3.pkgs; [
            numpy
            imageio
            docutils
            ddt
            matplotlib
          ];

          postPatch = ''
            ln -s */requires.txt requirements.txt
          '';

          # Some tests are broken and many require internet access
          doCheck = false;

          meta = {
            description = "Package enabling color transfer across images";
            homepage = "https://github.com/hahnec/color-matcher";
            license = super.lib.licenses.gpl3Plus;
            maintainers = with super.lib.maintainers; [ blenderfreaky ];
          };
        };
    })
  ];
}
