{
  grafanaDashboards+:: {
    'postgres-overview.json':  
    {
      "annotations": {
        "list": [
          {
            "builtIn": 1,
            "datasource": {
              "type": "datasource",
              "uid": "grafana"
            },
            "enable": true,
            "hide": true,
            "iconColor": "rgba(0, 211, 255, 1)",
            "name": "Annotations & Alerts",
            "target": {
              "limit": 100,
              "matchAny": false,
              "tags": [],
              "type": "dashboard"
            },
            "type": "dashboard"
          }
        ]
      },
      "description": "Performance metrics for Postgres",
      "editable": true,
      "fiscalYearStartMonth": 0,
      "gnetId": 455,
      "graphTooltip": 0,
      "id": 38,
      "links": [],
      "liveNow": false,
      "panels": [
        {
          "datasource": {
            "uid": "$datasource"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "fixedColor": "rgb(31, 120, 193)",
                "mode": "fixed"
              },
              "decimals": 0,
              "mappings": [
                {
                  "options": {
                    "match": "null",
                    "result": {
                      "text": "N/A"
                    }
                  },
                  "type": "special"
                }
              ],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  }
                ]
              },
              "unit": "none"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 7,
            "w": 4,
            "x": 0,
            "y": 0
          },
          "id": 11,
          "links": [],
          "maxDataPoints": 100,
          "options": {
            "colorMode": "none",
            "graphMode": "area",
            "justifyMode": "auto",
            "orientation": "horizontal",
            "reduceOptions": {
              "calcs": [
                "mean"
              ],
              "fields": "",
              "values": false
            },
            "textMode": "auto"
          },
          "pluginVersion": "9.4.3",
          "targets": [
            {
              "datasource": {
                "uid": "$datasource"
              },
              "dsType": "prometheus",
              "expr": "sum(irate(pg_stat_database_xact_commit{datname=~\"$db\",%(postgresExporterSelector)s}[$__rate_interval])) + sum(irate(pg_stat_database_xact_rollback{datname=~\"$db\",%(postgresExporterSelector)s}[$__rate_interval]))" % $._config,
              "format": "time_series",
              "groupBy": [
                {
                  "params": [
                    "$interval"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "null"
                  ],
                  "type": "fill"
                }
              ],
              "intervalFactor": 2,
              "measurement": "postgresql",
              "policy": "default",
              "refId": "A",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "xact_commit"
                    ],
                    "type": "field"
                  },
                  {
                    "params": [],
                    "type": "mean"
                  },
                  {
                    "params": [
                      "10s"
                    ],
                    "type": "non_negative_derivative"
                  }
                ]
              ],
              "step": 1800,
              "tags": [
                {
                  "key": "instance",
                  "operator": "=~",
                  "value": "/^$instance$/"
                }
              ]
            }
          ],
          "title": "QPS",
          "type": "stat"
        },
        {
          "datasource": {
            "uid": "$datasource"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "palette-classic"
              },
              "custom": {
                "axisCenteredZero": false,
                "axisColorMode": "text",
                "axisLabel": "",
                "axisPlacement": "auto",
                "barAlignment": 0,
                "drawStyle": "line",
                "fillOpacity": 10,
                "gradientMode": "none",
                "hideFrom": {
                  "legend": false,
                  "tooltip": false,
                  "viz": false
                },
                "lineInterpolation": "linear",
                "lineWidth": 1,
                "pointSize": 5,
                "scaleDistribution": {
                  "type": "linear"
                },
                "showPoints": "never",
                "spanNulls": true,
                "stacking": {
                  "group": "A",
                  "mode": "none"
                },
                "thresholdsStyle": {
                  "mode": "off"
                }
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              },
              "unit": "short"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 7,
            "w": 20,
            "x": 4,
            "y": 0
          },
          "id": 1,
          "links": [],
          "options": {
            "legend": {
              "calcs": [
                "mean",
                "max",
                "min"
              ],
              "displayMode": "table",
              "placement": "right",
              "showLegend": true
            },
            "tooltip": {
              "mode": "multi",
              "sort": "none"
            }
          },
          "pluginVersion": "9.4.3",
          "targets": [
            {
              "alias": "fetched",
              "datasource": {
                "uid": "$datasource"
              },
              "dsType": "prometheus",
              "expr": "sum(irate(pg_stat_database_tup_fetched{datname=~\"$db\",%(postgresExporterSelector)s}[$__rate_interval]))" % $._config,
              "format": "time_series",
              "groupBy": [
                {
                  "params": [
                    "$interval"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "null"
                  ],
                  "type": "fill"
                }
              ],
              "intervalFactor": 2,
              "legendFormat": "fetched",
              "measurement": "postgresql",
              "policy": "default",
              "refId": "A",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "tup_fetched"
                    ],
                    "type": "field"
                  },
                  {
                    "params": [],
                    "type": "mean"
                  },
                  {
                    "params": [
                      "10s"
                    ],
                    "type": "non_negative_derivative"
                  }
                ]
              ],
              "step": 120,
              "tags": [
                {
                  "key": "instance",
                  "operator": "=~",
                  "value": "/^$instance$/"
                }
              ]
            },
            {
              "alias": "fetched",
              "datasource": {
                "uid": "$datasource"
              },
              "dsType": "prometheus",
              "expr": "sum(irate(pg_stat_database_tup_returned{datname=~\"$db\",%(postgresExporterSelector)s}[$__rate_interval]))" % $._config,
              "format": "time_series",
              "groupBy": [
                {
                  "params": [
                    "$interval"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "null"
                  ],
                  "type": "fill"
                }
              ],
              "intervalFactor": 2,
              "legendFormat": "returned",
              "measurement": "postgresql",
              "policy": "default",
              "refId": "B",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "tup_fetched"
                    ],
                    "type": "field"
                  },
                  {
                    "params": [],
                    "type": "mean"
                  },
                  {
                    "params": [
                      "10s"
                    ],
                    "type": "non_negative_derivative"
                  }
                ]
              ],
              "step": 120,
              "tags": [
                {
                  "key": "instance",
                  "operator": "=~",
                  "value": "/^$instance$/"
                }
              ]
            },
            {
              "alias": "fetched",
              "datasource": {
                "uid": "$datasource"
              },
              "dsType": "prometheus",
              "expr": "sum(irate(pg_stat_database_tup_inserted{datname=~\"$db\",%(postgresExporterSelector)s}[$__rate_interval]))" % $._config,
              "format": "time_series",
              "groupBy": [
                {
                  "params": [
                    "$interval"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "null"
                  ],
                  "type": "fill"
                }
              ],
              "intervalFactor": 2,
              "legendFormat": "inserted",
              "measurement": "postgresql",
              "policy": "default",
              "refId": "C",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "tup_fetched"
                    ],
                    "type": "field"
                  },
                  {
                    "params": [],
                    "type": "mean"
                  },
                  {
                    "params": [
                      "10s"
                    ],
                    "type": "non_negative_derivative"
                  }
                ]
              ],
              "step": 120,
              "tags": [
                {
                  "key": "instance",
                  "operator": "=~",
                  "value": "/^$instance$/"
                }
              ]
            },
            {
              "alias": "fetched",
              "datasource": {
                "uid": "$datasource"
              },
              "dsType": "prometheus",
              "expr": "sum(irate(pg_stat_database_tup_updated{datname=~\"$db\",%(postgresExporterSelector)s}[$__rate_interval]))" % $._config,
              "format": "time_series",
              "groupBy": [
                {
                  "params": [
                    "$interval"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "null"
                  ],
                  "type": "fill"
                }
              ],
              "intervalFactor": 2,
              "legendFormat": "updated",
              "measurement": "postgresql",
              "policy": "default",
              "refId": "D",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "tup_fetched"
                    ],
                    "type": "field"
                  },
                  {
                    "params": [],
                    "type": "mean"
                  },
                  {
                    "params": [
                      "10s"
                    ],
                    "type": "non_negative_derivative"
                  }
                ]
              ],
              "step": 120,
              "tags": [
                {
                  "key": "instance",
                  "operator": "=~",
                  "value": "/^$instance$/"
                }
              ]
            },
            {
              "alias": "fetched",
              "datasource": {
                "uid": "$datasource"
              },
              "dsType": "prometheus",
              "expr": "sum(irate(pg_stat_database_tup_deleted{datname=~\"$db\",%(postgresExporterSelector)s}[$__rate_interval]))" % $._config,
              "format": "time_series",
              "groupBy": [
                {
                  "params": [
                    "$interval"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "null"
                  ],
                  "type": "fill"
                }
              ],
              "intervalFactor": 2,
              "legendFormat": "deleted",
              "measurement": "postgresql",
              "policy": "default",
              "refId": "E",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "tup_fetched"
                    ],
                    "type": "field"
                  },
                  {
                    "params": [],
                    "type": "mean"
                  },
                  {
                    "params": [
                      "10s"
                    ],
                    "type": "non_negative_derivative"
                  }
                ]
              ],
              "step": 120,
              "tags": [
                {
                  "key": "instance",
                  "operator": "=~",
                  "value": "/^$instance$/"
                }
              ]
            }
          ],
          "title": "Rows",
          "type": "timeseries"
        },
        {
          "datasource": {
            "uid": "$datasource"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "palette-classic"
              },
              "custom": {
                "axisCenteredZero": false,
                "axisColorMode": "text",
                "axisLabel": "",
                "axisPlacement": "auto",
                "barAlignment": 0,
                "drawStyle": "line",
                "fillOpacity": 10,
                "gradientMode": "none",
                "hideFrom": {
                  "legend": false,
                  "tooltip": false,
                  "viz": false
                },
                "lineInterpolation": "linear",
                "lineWidth": 1,
                "pointSize": 5,
                "scaleDistribution": {
                  "type": "linear"
                },
                "showPoints": "never",
                "spanNulls": true,
                "stacking": {
                  "group": "A",
                  "mode": "none"
                },
                "thresholdsStyle": {
                  "mode": "off"
                }
              },
              "mappings": [],
              "min": 0,
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              },
              "unit": "short"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 7,
            "w": 12,
            "x": 0,
            "y": 7
          },
          "id": 2,
          "links": [],
          "options": {
            "legend": {
              "calcs": [
                "mean",
                "max",
                "min"
              ],
              "displayMode": "table",
              "placement": "bottom",
              "showLegend": false
            },
            "tooltip": {
              "mode": "multi",
              "sort": "none"
            }
          },
          "pluginVersion": "9.4.3",
          "targets": [
            {
              "alias": "Buffers Allocated",
              "datasource": {
                "uid": "$datasource"
              },
              "dsType": "prometheus",
              "expr": "irate(pg_stat_bgwriter_buffers_alloc{%(postgresExporterSelector)s}[$__rate_interval])" % $._config,
              "format": "time_series",
              "groupBy": [
                {
                  "params": [
                    "$interval"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "null"
                  ],
                  "type": "fill"
                }
              ],
              "intervalFactor": 2,
              "legendFormat": "buffers_alloc",
              "measurement": "postgresql",
              "policy": "default",
              "refId": "A",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "buffers_alloc"
                    ],
                    "type": "field"
                  },
                  {
                    "params": [],
                    "type": "mean"
                  },
                  {
                    "params": [],
                    "type": "difference"
                  }
                ]
              ],
              "step": 240,
              "tags": [
                {
                  "key": "instance",
                  "operator": "=~",
                  "value": "/^$instance$/"
                }
              ]
            },
            {
              "alias": "Buffers Allocated",
              "datasource": {
                "uid": "$datasource"
              },
              "dsType": "prometheus",
              "expr": "irate(pg_stat_bgwriter_buffers_backend_fsync{%(postgresExporterSelector)s}[$__rate_interval])" % $._config,
              "format": "time_series",
              "groupBy": [
                {
                  "params": [
                    "$interval"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "null"
                  ],
                  "type": "fill"
                }
              ],
              "intervalFactor": 2,
              "legendFormat": "buffers_backend_fsync",
              "measurement": "postgresql",
              "policy": "default",
              "refId": "B",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "buffers_alloc"
                    ],
                    "type": "field"
                  },
                  {
                    "params": [],
                    "type": "mean"
                  },
                  {
                    "params": [],
                    "type": "difference"
                  }
                ]
              ],
              "step": 240,
              "tags": [
                {
                  "key": "instance",
                  "operator": "=~",
                  "value": "/^$instance$/"
                }
              ]
            },
            {
              "alias": "Buffers Allocated",
              "datasource": {
                "uid": "$datasource"
              },
              "dsType": "prometheus",
              "expr": "irate(pg_stat_bgwriter_buffers_backend{%(postgresExporterSelector)s}[$__rate_interval])" % $._config,
              "format": "time_series",
              "groupBy": [
                {
                  "params": [
                    "$interval"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "null"
                  ],
                  "type": "fill"
                }
              ],
              "intervalFactor": 2,
              "legendFormat": "buffers_backend",
              "measurement": "postgresql",
              "policy": "default",
              "refId": "C",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "buffers_alloc"
                    ],
                    "type": "field"
                  },
                  {
                    "params": [],
                    "type": "mean"
                  },
                  {
                    "params": [],
                    "type": "difference"
                  }
                ]
              ],
              "step": 240,
              "tags": [
                {
                  "key": "instance",
                  "operator": "=~",
                  "value": "/^$instance$/"
                }
              ]
            },
            {
              "alias": "Buffers Allocated",
              "datasource": {
                "uid": "$datasource"
              },
              "dsType": "prometheus",
              "expr": "irate(pg_stat_bgwriter_buffers_clean{%(postgresExporterSelector)s}[$__rate_interval])" % $._config,
              "format": "time_series",
              "groupBy": [
                {
                  "params": [
                    "$interval"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "null"
                  ],
                  "type": "fill"
                }
              ],
              "intervalFactor": 2,
              "legendFormat": "buffers_clean",
              "measurement": "postgresql",
              "policy": "default",
              "refId": "D",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "buffers_alloc"
                    ],
                    "type": "field"
                  },
                  {
                    "params": [],
                    "type": "mean"
                  },
                  {
                    "params": [],
                    "type": "difference"
                  }
                ]
              ],
              "step": 240,
              "tags": [
                {
                  "key": "instance",
                  "operator": "=~",
                  "value": "/^$instance$/"
                }
              ]
            },
            {
              "alias": "Buffers Allocated",
              "datasource": {
                "uid": "$datasource"
              },
              "dsType": "prometheus",
              "expr": "irate(pg_stat_bgwriter_buffers_checkpoint{%(postgresExporterSelector)s}[$__rate_interval])" % $._config,
              "format": "time_series",
              "groupBy": [
                {
                  "params": [
                    "$interval"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "null"
                  ],
                  "type": "fill"
                }
              ],
              "intervalFactor": 2,
              "legendFormat": "buffers_checkpoint",
              "measurement": "postgresql",
              "policy": "default",
              "refId": "E",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "buffers_alloc"
                    ],
                    "type": "field"
                  },
                  {
                    "params": [],
                    "type": "mean"
                  },
                  {
                    "params": [],
                    "type": "difference"
                  }
                ]
              ],
              "step": 240,
              "tags": [
                {
                  "key": "instance",
                  "operator": "=~",
                  "value": "/^$instance$/"
                }
              ]
            }
          ],
          "title": "Buffers",
          "type": "timeseries"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "$datasource"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "palette-classic"
              },
              "custom": {
                "axisCenteredZero": false,
                "axisColorMode": "text",
                "axisLabel": "",
                "axisPlacement": "auto",
                "barAlignment": 0,
                "drawStyle": "line",
                "fillOpacity": 10,
                "gradientMode": "none",
                "hideFrom": {
                  "legend": false,
                  "tooltip": false,
                  "viz": false
                },
                "lineInterpolation": "linear",
                "lineWidth": 2,
                "pointSize": 5,
                "scaleDistribution": {
                  "type": "linear"
                },
                "showPoints": "never",
                "spanNulls": true,
                "stacking": {
                  "group": "A",
                  "mode": "none"
                },
                "thresholdsStyle": {
                  "mode": "off"
                }
              },
              "mappings": [],
              "min": 0,
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              },
              "unit": "short"
            },
            "overrides": [
              {
                "matcher": {
                  "id": "byName",
                  "options": "deadlocks"
                },
                "properties": [
                  {
                    "id": "color",
                    "value": {
                      "fixedColor": "light-red",
                      "mode": "fixed"
                    }
                  }
                ]
              }
            ]
          },
          "gridPos": {
            "h": 7,
            "w": 12,
            "x": 12,
            "y": 7
          },
          "id": 3,
          "links": [],
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom",
              "showLegend": true
            },
            "tooltip": {
              "mode": "multi",
              "sort": "none"
            }
          },
          "pluginVersion": "9.4.3",
          "targets": [
            {
              "alias": "conflicts",
              "datasource": {
                "uid": "$datasource"
              },
              "dsType": "prometheus",
              "expr": "sum(pg_stat_database_deadlocks{datname=~\"$db\",%(postgresExporterSelector)s})" % $._config,
              "format": "time_series",
              "groupBy": [
                {
                  "params": [
                    "$interval"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "null"
                  ],
                  "type": "fill"
                }
              ],
              "intervalFactor": 2,
              "legendFormat": "deadlocks",
              "measurement": "postgresql",
              "policy": "default",
              "range": true,
              "refId": "A",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "conflicts"
                    ],
                    "type": "field"
                  },
                  {
                    "params": [],
                    "type": "mean"
                  },
                  {
                    "params": [],
                    "type": "difference"
                  }
                ]
              ],
              "step": 240,
              "tags": [
                {
                  "key": "instance",
                  "operator": "=~",
                  "value": "/^$instance$/"
                }
              ]
            },
            {
              "alias": "deadlocks",
              "datasource": {
                "uid": "$datasource"
              },
              "dsType": "prometheus",
              "editorMode": "code",
              "expr": "sum(pg_stat_database_conflicts{datname=~\"$db\",%(postgresExporterSelector)s})" % $._config,
              "format": "time_series",
              "groupBy": [
                {
                  "params": [
                    "$interval"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "null"
                  ],
                  "type": "fill"
                }
              ],
              "intervalFactor": 2,
              "legendFormat": "conflicts",
              "measurement": "postgresql",
              "policy": "default",
              "range": true,
              "refId": "B",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "deadlocks"
                    ],
                    "type": "field"
                  },
                  {
                    "params": [],
                    "type": "mean"
                  },
                  {
                    "params": [],
                    "type": "difference"
                  }
                ]
              ],
              "step": 240,
              "tags": [
                {
                  "key": "instance",
                  "operator": "=~",
                  "value": "/^$instance$/"
                }
              ]
            }
          ],
          "title": "Conflicts/Deadlocks",
          "type": "timeseries"
        },
        {
          "datasource": {
            "uid": "$datasource"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "palette-classic"
              },
              "custom": {
                "axisCenteredZero": false,
                "axisColorMode": "text",
                "axisLabel": "",
                "axisPlacement": "auto",
                "barAlignment": 0,
                "drawStyle": "line",
                "fillOpacity": 10,
                "gradientMode": "none",
                "hideFrom": {
                  "legend": false,
                  "tooltip": false,
                  "viz": false
                },
                "lineInterpolation": "linear",
                "lineWidth": 2,
                "pointSize": 5,
                "scaleDistribution": {
                  "type": "linear"
                },
                "showPoints": "never",
                "spanNulls": true,
                "stacking": {
                  "group": "A",
                  "mode": "none"
                },
                "thresholdsStyle": {
                  "mode": "off"
                }
              },
              "mappings": [],
              "max": 100,
              "min": 0,
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              },
              "unit": "percent"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 7,
            "w": 12,
            "x": 0,
            "y": 14
          },
          "id": 12,
          "links": [],
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom",
              "showLegend": true
            },
            "tooltip": {
              "mode": "multi",
              "sort": "none"
            }
          },
          "pluginVersion": "9.4.3",
          "targets": [
            {
              "datasource": {
                "uid": "$datasource"
              },
              "expr": "round(sum by (datname) (rate(pg_stat_database_blks_hit{datname=~\"$db\",%(postgresExporterSelector)s}[$__rate_interval])) / (sum by (datname)(rate(pg_stat_database_blks_hit{datname=~\"$db\",%(postgresExporterSelector)s}[$__rate_interval])) + sum by (datname)(rate(pg_stat_database_blks_read{datname=~\"$db\",%(postgresExporterSelector)s}[$__rate_interval])))*100,0.001)" % $._config,
              "format": "time_series",
              "legendFormat": "{{datname}} - cache hit rate",
              "refId": "A",
              "step": 240
            }
          ],
          "title": "Cache hit ratio",
          "type": "timeseries"
        },
        {
          "datasource": {
            "uid": "$datasource"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "palette-classic"
              },
              "custom": {
                "axisCenteredZero": false,
                "axisColorMode": "text",
                "axisLabel": "",
                "axisPlacement": "auto",
                "barAlignment": 0,
                "drawStyle": "line",
                "fillOpacity": 10,
                "gradientMode": "none",
                "hideFrom": {
                  "legend": false,
                  "tooltip": false,
                  "viz": false
                },
                "lineInterpolation": "linear",
                "lineWidth": 2,
                "pointSize": 5,
                "scaleDistribution": {
                  "type": "linear"
                },
                "showPoints": "never",
                "spanNulls": true,
                "stacking": {
                  "group": "A",
                  "mode": "none"
                },
                "thresholdsStyle": {
                  "mode": "off"
                }
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              },
              "unit": "short"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 7,
            "w": 12,
            "x": 12,
            "y": 14
          },
          "id": 13,
          "links": [],
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom",
              "showLegend": true
            },
            "tooltip": {
              "mode": "multi",
              "sort": "none"
            }
          },
          "pluginVersion": "9.4.3",
          "targets": [
            {
              "datasource": {
                "uid": "$datasource"
              },
              "expr": "pg_stat_database_numbackends{datname=~\"$db\",%(postgresExporterSelector)s}" % $._config,
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{datname}} - {{__name__}}",
              "refId": "A",
              "step": 240
            }
          ],
          "title": "Number of active connections",
          "type": "timeseries"
        }
      ],
      "refresh": false,
      "revision": 1,
      "schemaVersion": 38,
      "style": "dark",
      "tags": [
        "postgres"
      ],
      "templating": {
        "list": [
          {
            "hide": 0,
            "includeAll": false,
            "label": "Data Source",
            "multi": false,
            "name": "datasource",
            "options": [],
            "query": "prometheus",
            "refresh": 1,
            "regex": "",
            "skipUrlSync": false,
            "type": "datasource"
          },
          {
            "allValue": ".+",
            "current": {
              "selected": true,
              "text": [
                "All"
              ],
              "value": [
                "$__all"
              ]
            },
            "datasource": {
              "uid": "$datasource"
            },
            "definition": "label_values(pg_up, job)",
            "hide": 0,
            "includeAll": true,
            "label": "job",
            "multi": true,
            "name": "job",
            "options": [],
            "query": {
              "query": "label_values(pg_up, job)",
              "refId": "StandardVariableQuery"
            },
            "refresh": 1,
            "regex": "",
            "skipUrlSync": false,
            "sort": 0,
            "tagValuesQuery": "",
            "tagsQuery": "",
            "type": "query",
            "useTags": false
          },
          {
            "allValue": ".+",
            "current": {
              "selected": true,
              "text": [
                "All"
              ],
              "value": [
                "$__all"
              ]
            },
            "datasource": {
              "uid": "$datasource"
            },
            "definition": "label_values(pg_up{job=~\"$job\"},instance)",
            "hide": 0,
            "includeAll": true,
            "label": "instance",
            "multi": true,
            "name": "instance",
            "options": [],
            "query": {
              "query": "label_values(pg_up{job=~\"$job\"},instance)",
              "refId": "StandardVariableQuery"
            },
            "refresh": 1,
            "regex": "",
            "skipUrlSync": false,
            "sort": 0,
            "tagValuesQuery": "",
            "tagsQuery": "",
            "type": "query",
            "useTags": false
          },
          {
            "allValue": ".+",
            "datasource": {
              "uid": "$datasource"
            },
            "definition": "label_values(pg_stat_database_tup_fetched{%(postgresExporterSelector)s,datname!~\"template.*|postgres\"},datname)" % $._config,
            "hide": 0,
            "includeAll": true,
            "label": "db",
            "multi": false,
            "name": "db",
            "options": [],
            "query": {
              "query": "label_values(pg_stat_database_tup_fetched{%(postgresExporterSelector)s,datname!~\"template.*|postgres\"},datname)" % $._config,
              "refId": "StandardVariableQuery"
            },
            "refresh": 1,
            "regex": "",
            "skipUrlSync": false,
            "sort": 0,
            "tagValuesQuery": "",
            "tagsQuery": "",
            "type": "query",
            "useTags": false
          }
        ]
      },
      "time": {
        "from": "now-1h",
        "to": "now"
      },
      "timepicker": {
        "refresh_intervals": [
          "5s",
          "10s",
          "30s",
          "1m",
          "5m",
          "15m",
          "30m",
          "1h",
          "2h",
          "1d"
        ],
        "time_options": [
          "5m",
          "15m",
          "1h",
          "6h",
          "12h",
          "24h",
          "2d",
          "7d",
          "30d"
        ]
      },
      "timezone": "browser",
      "title": "Postgres Overview",
      "uid": "wGgaPlciz",
      "version": 39,
      "weekStart": ""
    },
  },
}
