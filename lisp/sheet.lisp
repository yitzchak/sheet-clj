(in-package :sheet)


(jupyter/widgets:defwidget cell (jupyter/widgets:widget)
  ((value
     :accessor jupyter/widgets:widget-value
     :initarg :value
     :initform :null
     :trait :json)
   (row-start
     :accessor row-start
     :initarg :row-start
     :trait :int)
   (row-end
     :accessor row-end
     :initarg :row-end
     :trait :int)
   (column-start
     :accessor column-start
     :initarg :column-start
     :trait :int)
   (column-end
     :accessor column-end
     :initarg :column-end
     :trait :int)
   (type
     :accessor %type
     :initarg :type
     :initform nil
     :trait :string)
   (name
     :accessor name
     :initarg :name
     :initform nil
     :trait :string)
   (style
     :accessor style
     :initarg :style
     :initform nil
     :trait :alist)
   (renderer
     :accessor renderer
     :initarg :renderer
     :initform nil
     :trait :string)
   (read-only
     :accessor read-only
     :initarg :read-only
     :initform nil
     :trait :bool)
   (squeeze-row
     :accessor squeeze-row
     :initarg :squeeze-row
     :initform t
     :trait :bool)
   (squeeze-column
     :accessor squeeze-column
     :initarg :squeeze-column
     :initform t
     :trait :bool)
   (transpose
     :accessor transpose
     :initarg :transpose
     :initform nil
     :trait :bool)
   (choice
     :accessor choice
     :initarg :choice
     :initform nil
     :trait :string-list)
   (numeric-format
     :accessor numeric-format
     :initarg :numeric-format
     :initform "0.000"
     :trait :string)
   (date-format
     :accessor date-format
     :initarg :date-format
     :initform "YYYY/MM/DD"
     :trait :string)
   (time-format
     :accessor time-format
     :initarg :time-format
     :initform "h:mm:ss a"
     :trait :string))
  (:default-initargs
    :%model-name "CellRangeModel"
    :%model-module +module-name+
    :%model-module-version +module-version+
    :%view-module +module-name+
    :%view-module-version +module-version+))


(jupyter/widgets:defwidget sheet (jupyter/widgets:dom-widget)
  ((rows
     :accessor rows
     :initarg :rows
     :initform 3
     :trait :int)
   (columns
     :accessor columns
     :initarg :columns
     :initform 4
     :trait :int)
   (cells
     :accessor cells
     :initarg :cells
     :initform nil
     :trait :widget-list)
   (named-cells
     :accessor named-cells
     :initarg :named-cells
     :initform nil
     :trait :widget-alist)
   (row-headers
     :accessor row-headers
     :initarg :row-headers
     :initform nil
     :trait :string-list)
   (column-headers
     :accessor column-headers
     :initarg :column-headers
     :initform nil
     :trait :string-list)
   (stetch-headers
     :accessor stetch-headers
     :initarg :stetch-headers
     :initform "all"
     :trait :string)
   (column-width
     :accessor column-width
     :initarg :column-width
     :initform nil
     :trait :json)
   (column-resizing
     :accessor column-resizing
     :initarg :column-resizing
     :initform t
     :trait :bool)
   (row-resizing
     :accessor row-resizing
     :initarg :row-resizing
     :initform t
     :trait :bool)
   (search-token
     :accessor search-token
     :initarg :search-token
     :initform ""
     :trait :string))
  (:default-initargs
    :%model-name "SheetModel"
    :%model-module +module-name+
    :%model-module-version +module-version+
    :%view-name "SheetView"
    :%view-module +module-name+
    :%view-module-version +module-version+
    :layout (make-instance 'jupyter/widgets:layout :width "auto" :height "auto")))


(defun cell (instance row column)
  (or (find-if (lambda (cell)
                 (and (= row (row-start cell) (row-end cell))
                      (= column (column-start cell) (column-end cell))))
               (cells instance))
      (error "no cell was previously created for (row, column) = (~A, ~A)" row column)))


(jupyter/widgets:defwidget renderer (jupyter/widgets:widget)
  ((name
     :accessor name
     :initarg :name
     :initform nil
     :trait :string)
   (code
     :accessor code
     :initarg :renderer
     :initform ""
     :trait :string))
  (:default-initargs
    :%model-name "RendererModel"
    :%model-module +module-name+
    :%model-module-version +module-version+
    :%view-module +module-name+
    :%view-module-version +module-version+))

